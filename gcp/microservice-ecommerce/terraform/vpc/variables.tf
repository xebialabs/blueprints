# Subnet variables

variable "region" {
  description = "Region of resources"
}

variable "subnet_cidr" {
  type        = "map"
  description = "Subnet range"
}
