variable "cluster_name" {
  description = "The name of the Azure Kubernetes Service cluster"
}

variable "resource_group" {
  description = "A resource group is a collection of resources that share the same lifecycle, permissions, and policies"
}

variable "resource_group_location" {
  description = "The Azure location where all resources in this example should be created"
}

variable "client_id" {
  description = "Service Principal Client ID"
}

variable "client_secret" {
  description = "Service Principal Client secret"
}

variable "subscription_id" {
  description = "Azure Subscription ID to be used for billing"
}

variable "tenant_id" {
  description = "Service Principal Tenant ID"
}

variable "linux_profile_admin_user" {
  description = "The default Linux admin user for logging into the master"
  default     = "adminuser"
}
