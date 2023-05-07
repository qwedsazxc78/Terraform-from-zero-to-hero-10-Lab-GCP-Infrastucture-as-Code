##################################################################################
# RESOURCE
##################################################################################
resource "google_redis_instance" "cache" {
  name           = var.redis_name
  display_name   = "Terraform Test Instance - ${var.redis_name}"
  tier           = "BASIC"
  memory_size_gb = 1
  redis_version  = "REDIS_6_X"

  region = var.GCP_REGION

  persistence_config {
    rdb_snapshot_period = "TWENTY_FOUR_HOURS"
  }
}
