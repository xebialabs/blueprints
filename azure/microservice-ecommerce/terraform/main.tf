# Configure the Azure Cloud provider

provider "azurerm" {
  version = "=1.24.0"

  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# export ARM_ACCESS_KEY="xCddE4AHqOfkhlAcV0t+q8T3nJmsndstFa+nsbE/wyQU27f7tO2dTktzw1IH0rzpCa9Qc16dxykwnBePyOYTMQ=="

module "aks" {
  source              = "./aks"
  resource_group      = "${var.resource_group}"
  cluster_name        = "${var.cluster_name}"
  location            = "${var.location}"
  vm_size             = "${var.vm_size}"
  node_count          = "${var.node_count}"
  admin_username      = "${var.admin_username}"
  client_id           = "${var.client_id}"
  client_secret       = "${var.client_secret}"
  dns_prefix          = "${var.dns_prefix}"
  ssh_public_key_path = "${var.ssh_public_key_path}"
}
