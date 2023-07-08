resource "google_redis_instance" "cache" {
  name         = var.redis_name
  display_name = "terraform 101 - ${var.redis_name}"
  region       = var.GCP_REGION

  memory_size_gb = 1
  tier           = "BASIC"
  redis_version  = "REDIS_6_X"

  persistence_config {
    rdb_snapshot_period = "TWENTY_FOUR_HOURS"
  }
}
