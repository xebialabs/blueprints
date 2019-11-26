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

variable "vm_size" {
  description = "The type of VM"
  default     = "Standard_B2ms"
}

variable "node_count" {
  description = "The size of the virtual machines that will form the nodes in the cluster. This cannot be changed after creating the cluster"
  default     = 3
}

variable "admin_username" {
  # * AdminUsername
  description = "The username for the cluster (cannot be 'admin')"
  default     = "adminuser"
}

variable "dns_prefix" {
  description = "DNS name prefix to use with the hosted Kubernetes API server FQDN. You will use this to connect to the Kubernetes API when managing containers after creating the cluster"
  default     = "k8s"
}

