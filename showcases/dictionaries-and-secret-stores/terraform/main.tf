# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "terraformgroup" {
  name     = "${var.resource_group}"
  location = "${var.location}"

  tags = {
    environment = "Terraform Demo"
  }
}

# Create virtual network
resource "azurerm_virtual_network" "terraformnetwork" {
  name                = "vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraformgroup.name}"

  tags = {
    environment = "Terraform Demo"
  }
}

# Create subnet
resource "azurerm_subnet" "terraformsubnet" {
  name                 = "subnet"
  resource_group_name  = "${azurerm_resource_group.terraformgroup.name}"
  virtual_network_name = "${azurerm_virtual_network.terraformnetwork.name}"
  address_prefix       = "10.0.1.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "terraformpublicip" {
  name                = "publicIP"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraformgroup.name}"
  allocation_method   = "Dynamic"

  tags = {
    environment = "Terraform Demo"
  }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "terraformnsg" {
  name                = "networkSecurityGroup"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraformgroup.name}"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Terraform Demo"
  }
}

# Create network interface
resource "azurerm_network_interface" "terraformnic" {
  name                      = "nic"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.terraformgroup.name}"
  network_security_group_id = "${azurerm_network_security_group.terraformnsg.id}"

  ip_configuration {
    name                          = "nicConfiguration"
    subnet_id                     = "${azurerm_subnet.terraformsubnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.terraformpublicip.id}"
  }

  tags = {
    environment = "Terraform Demo"
  }
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${azurerm_resource_group.terraformgroup.name}"
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mtorageaccount" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = "${azurerm_resource_group.terraformgroup.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Terraform Demo"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "terraformvm" {
  name                  = "vm"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.terraformgroup.name}"
  network_interface_ids = ["${azurerm_network_interface.terraformnic.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "osDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.vm_name}"
    admin_username = "${var.os_username}"
    admin_password = "${var.os_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.storageaccount.primary_blob_endpoint}"
  }

  tags = {
    environment = "Terraform Demo"
  }
}

data "azurerm_public_ip" "terraformpublicip" {
  name                = "${azurerm_public_ip.terraformpublicip.name}"
  resource_group_name = "${azurerm_resource_group.terraformgroup.name}"
  depends_on          = ["azurerm_virtual_machine.terraformvm"]
}
