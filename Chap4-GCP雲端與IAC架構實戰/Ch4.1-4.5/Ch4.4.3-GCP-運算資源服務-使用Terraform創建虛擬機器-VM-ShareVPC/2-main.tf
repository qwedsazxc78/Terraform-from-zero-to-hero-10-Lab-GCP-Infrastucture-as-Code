##################################################################################
# RESOURCE
##################################################################################
data "google_compute_subnetwork" "share_vpc" {
  // "host-project"
  project = "replace project"
  name    = "replace subnet"
  region  = "asia-northeast1"
}

resource "google_compute_instance" "example" {
  // "service-project"
  project      = var.GCP_PROJECT
  name         = var.instance_name
  zone         = var.zone
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.share_vpc.self_link
  }

}

output "name" {
  value = data.google_compute_subnetwork.share_vpc.self_link
}
