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

  # 失敗案例，無法連線到遠端
  provisioner "remote-exec" {
    inline = [
      "echo ${google_compute_instance.example.network_interface[0].network_ip} > /tmp/ip_address_remote_exec.txt"
    ]
  }

  # 成功案例，虛擬電腦本機執行
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.example.network_interface[0].network_ip} > /tmp/ip_address_local_exec.txt"
  }

  # 成功案例，傳送到虛擬電腦本機
  provisioner "file" {
    content     = google_compute_instance.example.network_interface[0].network_ip
    destination = "/tmp/ip_address_file.txt"
  }
}
