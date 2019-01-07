# Configure the Google Cloud provider

provider "google" {
#   credentials = "${file("account.json")}"
  credentials = <<EOF
  #  account.json content goes here
  EOF
  version = "~> 1.16"
  project = "${var.project_id}"
  region  = "${var.region}"
}

# Create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = "false"
}

# Create Subnet

resource "google_compute_subnetwork" "subnet" {
  depends_on    = ["google_compute_network.vpc"]
  name          = "${var.name}-subnet"
  ip_cidr_range = "${var.subnet_cidr}"
  network       = "${var.name}-vpc"
  region        = "${var.region}"
}

# VPC firewall configuration
# Create a firewall rule that allows internal communication across all protocols:
resource "google_compute_firewall" "firewalli-int" {
  depends_on    = ["google_compute_subnetwork.subnet"]
  name    = "${var.name}-firewall-int"
  network = "${var.name}-vpc"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = ["${google_compute_subnetwork.subnet.ip_cidr_range}"]
}

# Create a firewall rule that allows external SSH, ICMP, and HTTPS:
resource "google_compute_firewall" "firewalli-ext" {
  depends_on    = ["google_compute_subnetwork.subnet"]
  name    = "${var.name}-firewall-ext"
  network = "${var.name}-vpc"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }

  source_ranges = ["0.0.0.0/0"]
}


# Create GKE cluster
resource "google_container_cluster" "primary" {
  name = "gke-${var.name}-cluster"
  zone = "${var.region}-b"

  additional_zones = [
    "${var.region}-c",
  ]

  min_master_version = "${var.min_master_version}"
  node_version       = "${var.node_version}"
  initial_node_count = "${var.gke_num_nodes}"
  network            = "${google_compute_network.vpc.name}"
  subnetwork         = "${google_compute_subnetwork.subnet.name}"
  enable_legacy_abac = false

  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }

    kubernetes_dashboard {
      disabled = false
    }
  }

  master_auth {
    username = "${var.gke_master_user}"
    password = "${var.gke_master_pass}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      env = "${var.gke_label}"
    }

    disk_size_gb = 10
    machine_type = "${var.gke_node_machine_type}"
    tags         = ["gke-node"]
  }
}
