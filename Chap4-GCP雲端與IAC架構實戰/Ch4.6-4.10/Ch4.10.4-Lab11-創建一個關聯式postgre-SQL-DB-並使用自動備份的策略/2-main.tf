##################################################################################
# RESOURCE
##################################################################################
resource "google_sql_database_instance" "instance" {
  name                = var.db_name
  database_version    = "POSTGRES_14"
  deletion_protection = false

  settings {
    tier      = "db-n1-standard-2" # 使用標準的硬體配備
    disk_size = "10"

    availability_type = "REGIONAL"

    backup_configuration {
      enabled            = true
      start_time         = "03:00" # 設定每日備份時間
      binary_log_enabled = true    # 啟用二進制日誌備份
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
