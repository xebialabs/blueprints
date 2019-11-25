variable "cluster_name" {
  description = "Name of the cluster"
}

variable "subscription_id" {
  description = "Client ID"
}

variable "client_id" {
  description = "Client ID"
}

variable "client_secret" {
  description = "Client secret"
}

variable "tenant_id" {
  description = "Tenant ID"
}

variable "resource_group" {
  description = "Resource group under which the cluster will be created"
}

variable "resource_group_location" {
  description = "Geographic location of the cluster"
}

variable "linux_profile_admin_user" {
  description = "The default Linux admin user for logging into the master"
  default     = "adminuser"
}
