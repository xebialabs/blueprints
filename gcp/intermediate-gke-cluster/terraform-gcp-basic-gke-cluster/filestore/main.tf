resource "google_filestore_instance" "instance" {
  name = "${var.name}"
  zone = "${var.zone}"
  tier = "${var.tier}"

  file_shares {
    capacity_gb = "${var.filestore_capacity}"
    name        = "{var.share_name}"
  }

  networks {
    network = "${var.name}-vpc"
    modes   = ["MODE_IPV4"]
  }
}