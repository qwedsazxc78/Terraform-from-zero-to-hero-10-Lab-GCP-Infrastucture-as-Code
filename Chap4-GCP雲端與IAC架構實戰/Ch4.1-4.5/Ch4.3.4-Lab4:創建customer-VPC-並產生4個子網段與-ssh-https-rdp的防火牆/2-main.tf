##################################################################################
# RESOURCE
##################################################################################
# 創建VPC虛擬私人網路
resource "google_compute_network" "customer_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}
# 創建子網域
resource "google_compute_subnetwork" "japan_subnet_1" {
  name          = "japan-subnet-1"
  network       = google_compute_network.customer_network.self_link
  ip_cidr_range = "10.0.1.0/24"
  region        = "asia-northeast1"
}

resource "google_compute_subnetwork" "japan_subnet_2" {
  name          = "japan-subnet-2"
  network       = google_compute_network.customer_network.self_link
  ip_cidr_range = "10.0.2.0/24"
  region        = "asia-northeast2"
}

resource "google_compute_subnetwork" "singapore_subnet" {
  name          = "singapore-subnet"
  network       = google_compute_network.customer_network.self_link
  ip_cidr_range = "10.1.0.0/24"
  region        = "asia-southeast1"
}

resource "google_compute_subnetwork" "hongkong_subnet" {
  name          = "hongkong-subnet"
  network       = google_compute_network.customer_network.self_link
  ip_cidr_range = "10.2.0.0/24"
  region        = "asia-east2"
}

# 創建防火牆
resource "google_compute_firewall" "ssh_https_rdp_firewall" {
  name    = "ssh-https-rdp-firewall"
  network = google_compute_network.customer_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}
