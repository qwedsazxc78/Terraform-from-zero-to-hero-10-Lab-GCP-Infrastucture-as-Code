##################################################################################
# RESOURCE
##################################################################################
resource "google_redis_instance" "cache" {
  name           = var.redis_name
  display_name   = "Terraform Test Instance - ${var.redis_name}"
  tier           = "STANDARD_HA"
  memory_size_gb = 1
  redis_version  = "REDIS_6_X"

  location_id = var.GCP_ZONE

  persistence_config {
    persistence_mode    = "RDB"
    rdb_snapshot_period = "TWENTY_FOUR_HOURS"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "TUESDAY"
      start_time {
        hours   = 0
        minutes = 30
      }
    }
  }
}
