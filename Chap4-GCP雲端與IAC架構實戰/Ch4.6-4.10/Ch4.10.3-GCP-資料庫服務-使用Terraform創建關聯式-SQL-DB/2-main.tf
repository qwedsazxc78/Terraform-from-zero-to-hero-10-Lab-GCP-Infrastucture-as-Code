##################################################################################
# RESOURCE
##################################################################################
resource "google_sql_database_instance" "instance" {
  name             = "example-instance"
  database_version = "POSTGRES_14"

  settings {
    tier = "db-f1-micro" # 使用最簡單的 CPU 和硬碟空間設定

    ip_configuration {
      ipv4_enabled                                  = true
      private_network                               = "projects/${var.GCP_PROJECT}/global/networks/default"
      enable_private_path_for_google_cloud_services = true


      dynamic "authorized_networks" {
        for_each = ["0.0.0.0/0"] # 允許從任意 IP 地址訪問資料庫
        content {
          value = authorized_networks.key
        }
      }
    }
  }
}

resource "google_sql_database" "this" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
}

output "db_ip" {
  value = google_sql_database_instance.instance.public_ip_address
}
