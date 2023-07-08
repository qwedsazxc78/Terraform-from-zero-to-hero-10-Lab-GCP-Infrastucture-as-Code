##################################################################################
# RESOURCE
##################################################################################
locals {
  allow_ips = ["0.0.0.0/0", ]
}

resource "google_sql_database_instance" "instance" {
  name                = var.db_name
  database_version    = "POSTGRES_14"
  deletion_protection = false

  settings {
    tier      = "db-f1-micro" # 使用基本的硬體配備
    disk_size = "10"

    ip_configuration {
      dynamic "authorized_networks" {
        for_each = local.allow_ips
        iterator = allow_ips

        content {
          name  = "allow-${allow_ips.key}"
          value = allow_ips.value
        }
      }
    }
  }
}

resource "google_sql_database" "this" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "users" {
  name     = "admin"
  instance = google_sql_database_instance.instance.name
  password = "admin!@#$%"
}

output "db_ip" {
  value = google_sql_database_instance.instance.public_ip_address
}
