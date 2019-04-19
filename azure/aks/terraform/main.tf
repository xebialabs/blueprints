##################################################################################
# RESOURCES
##################################################################################

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.24.0"

  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

data "azurerm_subscription" "subscription" {}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}

#an attempt to keep the AKS name (and dns label) unique
resource "random_integer" "random_int" {
  min = 100
  max = 999
}

resource "tls_private_key" "key" {
  algorithm   = "RSA"
  ecdsa_curve = "P224"
  rsa_bits    = "2048"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "one-vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"

  tags {
    source = "terraform"
    env    = "${var.environment}"
  }
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.0.1.0/28"
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "external" {
  name                 = "external"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.0.3.0/28"
}

resource "azurerm_subnet" "x-site" {
  name                 = "x-site"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.0.4.0/28"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name       = "${var.aks_name}-${random_integer.random_int.result}"
  location   = "${azurerm_resource_group.rg.location}"
  dns_prefix = "${var.aks_name}-${random_integer.random_int.result}-k8s"

  resource_group_name = "${azurerm_resource_group.rg.name}"

  linux_profile {
    admin_username = "${var.linux_admin_username}"

    ssh_key {
      key_data = "${trimspace(tls_private_key.key.public_key_openssh)}"
    }
  }

  agent_pool_profile {
    name    = "agentpool"
    count   = "${var.aks_node_count}"
    vm_size = "Standard_DS2_v2"
    os_type = "Linux"
    os_disk_size_gb = 30

    vnet_subnet_id = "${azurerm_subnet.backend.id}"
    max_pods       = 30
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  role_based_access_control  {
    enabled = true  

    azure_active_directory {
      # NOTE: in a Production environment these should be different values
      # but for the purposes of this example, this should be sufficient
      client_app_id = "${var.client_id}"

      server_app_id     = "${var.client_id}"
      server_app_secret = "${var.client_secret}"
    }
  }

  network_profile {
    network_plugin     = "azure"
    service_cidr       = "10.100.0.0/16"
    dns_service_ip     = "10.100.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  tags {
    source = "terraform"
    env    = "${var.environment}"
  }
}

provider "kubernetes" {
  host                   = "${azurerm_kubernetes_cluster.aks.kube_admin_config.0.host}"
  
  client_certificate     = "${base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate)}"
  client_key             = "${base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate)}"

}

resource "kubernetes_cluster_role_binding" "cluster-admin-deployment-rights" {
    metadata {
        name = "cluster-admin-deployment-rights"
    }
    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind = "ClusterRole"
        name = "cluster-admin"
    }
    subject {
        kind = "User"
        name = "clusterAdmin"
        api_group = "rbac.authorization.k8s.io"
    }
    subject {
        kind = "User"
        name = "clusterUser"
        api_group = "rbac.authorization.k8s.io"
    }
}