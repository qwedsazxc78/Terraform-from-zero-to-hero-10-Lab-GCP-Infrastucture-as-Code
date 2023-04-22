##################################################################################
# PROVISIONER
##################################################################################

# gcp sample
resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "e2-micro"
  zone         = "asia-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

}
