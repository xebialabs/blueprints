# GCP variables

variable "region" {
  default     = "asia-southeast1"
  description = "Region of resources"
}

variable "bucket_name" {
  description = "Name of the google storage bucket"
}

variable "name" {
  default = {
    prod = "prod"
    dev  = "dev"
  }

  description = "Name for vpc"
}

# Network variables

variable "subnet_cidr" {
  default = {
    prod = "10.10.0.0/24"
    dev  = "10.240.0.0/24"
  }

  description = "Subnet range"
}

# GKE variables

variable "min_master_version" {
  default     = "1.10.7-gke.6"
  description = "Number of nodes in each GKE cluster zone"
}

variable "node_version" {
  default     = "1.10.7-gke.6"
  description = "Number of nodes in each GKE cluster zone"
}

variable "gke_num_nodes" {
  default = {
    prod = 2
    dev  = 1
  }

  description = "Number of nodes in each GKE cluster zone"
}

variable "gke_master_user" {
  default     = "k8s_admin"
  description = "Username to authenticate with the k8s master"
}

variable "gke_master_pass" {
  description = "Username to authenticate with the k8s master"
}

variable "gke_node_machine_type" {
  default     = "n1-standard-1"
  description = "Machine type of GKE nodes"
}

variable gke_label {
  default = {
    prod = "prod"
    dev  = "dev"
  }

  description = "label"
}
