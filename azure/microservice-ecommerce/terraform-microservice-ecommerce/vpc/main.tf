resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-vnet"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group}"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  depends_on           = ["azurerm_virtual_network.vnet"]
  name                 = "${var.name}-internal"
  resource_group_name  = "${var.resource_group}"
  address_prefix       = "10.1.2.0/24"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}

resource "azurerm_network_security_group" "security" {
  name                = "${var.name}-nsg"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group}"
}

resource "azurerm_network_security_rule" "ssh_https" {
  name                        = "${var.name}-ssh_https"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = [22, 6443]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.resource_group}"
  network_security_group_name = "${azurerm_network_security_group.security.name}"
}
