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

  # 安裝 nginx
  metadata_startup_script = "sudo apt update -y && sudo apt install nginx -y"
}

# 產生區域硬碟並連結虛擬機器
resource "google_compute_region_disk" "example" {
  name   = "example-disk"
  type   = "pd-standard"
  region = var.location
  size   = 200

  replica_zones = ["asia-northeast1-a", "asia-northeast1-b"]
}

resource "google_compute_attached_disk" "example" {
  disk     = google_compute_region_disk.example.self_link
  instance = google_compute_instance.example.self_link
  mode     = "READ_WRITE"
}

output "instance_ip" {
  value = google_compute_instance.example.network_interface[0].access_config[0].nat_ip
}
