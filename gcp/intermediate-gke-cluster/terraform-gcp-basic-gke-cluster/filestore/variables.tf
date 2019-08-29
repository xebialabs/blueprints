# Filestore variables

variable "name" {
  description = "Name for project"
}

variable "zone" {
  description = "Zone where Filestore instance resides"
}

variable "tier" {
  description = "The service tier of Filestore instance"
}

variable "filestore_capacity" {
  description = "Filestore file share capacity in GB"
}

variable "share_name" {}
  description = "The name of the fileshare"
}