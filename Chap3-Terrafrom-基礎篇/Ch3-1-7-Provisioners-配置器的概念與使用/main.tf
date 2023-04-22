##################################################################################
# PROVISIONER
##################################################################################

# gcp sample
resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "e2-micro"
  zone         = "asia-east1-b"

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

  provisioner "remote-exec" {
    inline = [
      "echo ${google_compute_instance.example.network_interface[0].network_ip} > ip_address_remote_exec.txt"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${google_compute_instance.example.network_interface[0].network_ip} > ip_address_local_exec.txt"
  }

  provisioner "file" {
    content     = google_compute_instance.example.network_interface[0].network_ip
    destination = "./ip_address_file.txt"
  }
}
