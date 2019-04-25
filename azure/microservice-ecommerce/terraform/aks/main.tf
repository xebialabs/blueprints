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
    vm_size         = "${var.vm_size}"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  linux_profile {
    # WARNING: The name 'admin' is not allowed
    admin_username = "${var.admin_username}"

    ssh_key {
      key_data = "${var.ssh_public_key_path}"
    }
  }

  tags {
    Environment = "Demo"
  }
}
