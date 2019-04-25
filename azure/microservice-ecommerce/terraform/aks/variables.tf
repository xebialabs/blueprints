variable "resource_group" {
  description = "A resource group is a collection of resources that share the same lifecycle, permissions, and policies"
}

variable "cluster_name" {
  description = "The name of the Azure Kubernetes Service cluster"
}

variable "location" {
  description = "Location of resources"
}

variable "vm_size" {
  description = "The type of VM"
}

variable "node_count" {
  description = "The size of the virtual machines that will form the nodes in the cluster. This cannot be changed after creating the cluster"
}

variable "admin_username" {
  description = "The username for the cluster (cannot be 'admin')"
}

variable "ssh_public_key_path" {
  description = ""
}

variable "client_id" {
  description = "The appId of the Service Principal"
}

variable "client_secret" {
  description = "The password of the Service Principal"
}

variable "dns_prefix" {
  description = "DNS name prefix to use with the hosted Kubernetes API server FQDN. You will use this to connect to the Kubernetes API when managing containers after creating the cluster"
}

