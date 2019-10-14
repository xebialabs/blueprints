variable "subscription_id" {
  description = "Subscription ID"
}

variable "tenant_id" {
  description = "Tenant ID"
}

variable "client_id" {
  description = "Client ID"
}

variable "client_secret" {
  description = "Client Secret"
}

variable "resource_group" {
  description = "The group under which everything will be created"
}

variable "location" {
  description = "Where the resources will be created"
}

variable "vm_size" {
  description = "The size of the VM"
}

variable "vm_name" {
  description = "The name of the VM"
}

variable "os_username" {
  description = "Login username for the OS"
}

variable "os_password" {
  description = "Login password for the OS"
}
