##################################################################################
# RESOURCE
##################################################################################
resource "google_compute_instance" "example" {
  name         = var.instance_name
  zone         = var.zone
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

output "instance_ip" {
  value = google_compute_instance.example.network_interface[0].access_config[0].nat_ip
}
