# terraform import -var-file=terraform.tfvars aws_vpc.jkmonolith-ecs-vpc jkmonolith-ecs-vpc
# {{$app := .AppName | kebabcase}}
# https://www.terraform.io/docs/import/usage.html
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "app_name" {}
variable "region" {}
variable "mysql_master_password" {}
variable "mysql_address" {}
variable "mysql_port" {}
