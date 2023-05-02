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
