# Question: Do I try to create a Resource Group if one doesn't already exist? I don't think I should
resource "azurerm_resource_group" "k8s" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  dns_prefix          = "${var.dns_prefix}"

  agent_pool_profile {
    name            = "default"
    count           = "${var.node_count}"
    vm_size         = "${var.vm_size}"    # Question: Should this be configurable?
    os_type         = "Linux"
    os_disk_size_gb = 30                  # Question: Should this be configurable?
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  # Question: Should this be excluded? Or made optional? Is it necessary to log into the nodes for a demo?
  # Question: Maybe ask: Do you want to be able to SSH into the nodes (requires an SSH key file)?
  # Note: Allows us to configure the settings which enable logging into the worker nodes using ssh
  linux_profile {
    # WARNING: The name 'admin' is not allowed
    admin_username = "${var.admin_username}" # Question: Make a variable like the GCP example?

    ssh_key {
      key_data = "${var.ssh_public_key_path}"
    }
  }

  tags {
    Environment = "Demo"
  }
}
