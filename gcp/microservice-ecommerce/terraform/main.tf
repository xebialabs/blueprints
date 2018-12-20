# Configure the Google Cloud provider

data "terraform_remote_state" "project_id" {
  backend   = "gcs"
  workspace = "${terraform.workspace}"

  config {
    bucket = "${var.bucket_name}"
    prefix = "terraform-project"
  }
}

provider "google" {
  version = "~> 1.16"
  project = "${data.terraform_remote_state.project_id.project_id}"
  region  = "${var.region}"
}

module "vpc" {
  source        = "./vpc"
  region        = "${var.region}"
  subnet_cidr   = "${var.subnet_cidr}"
}

module "gke" {
  source                = "./gke"
  region                = "${var.region}"
  min_master_version    = "${var.min_master_version}"
  node_version          = "${var.node_version}"
  gke_num_nodes         = "${var.gke_num_nodes}"
  vpc_name              = "${module.vpc.vpc_name}"
  subnet_name           = "${module.vpc.subnet_name}"
  gke_master_user       = "${var.gke_master_user}"
  gke_master_pass       = "${var.gke_master_pass}"
  gke_node_machine_type = "${var.gke_node_machine_type}"
  gke_label             = "${var.gke_label}"
}
