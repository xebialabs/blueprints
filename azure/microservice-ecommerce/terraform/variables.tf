variable "resource_group_name" {
  # * ResourceGroup
  description = "A resource group is a collection of resources that share the same lifecycle, permissions, and policies"
}

variable "cluster_name" {
  # * ClusterName
  description = "The name of the Azure Kubernetes Service cluster"
}

variable "location" {
  # * AKSRegion
  description = "Location of resources"
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

variable "client_id" {
  # * ClientID
  description = "The appId of the Service Principal"
}

variable "client_secret" {
  # * ClientSecret
  description = "The password of the Service Principal"
}

variable "subscription_id" {
  # * SubscriptionID
  description = "The Azure subscription id"
}

variable "tenant_id" {
  # * TenantID
  description = "The Azure tenant id"
}

variable "dns_prefix" {
  description = "DNS name prefix to use with the hosted Kubernetes API server FQDN. You will use this to connect to the Kubernetes API when managing containers after creating the cluster"
  default     = "k8s"
}

