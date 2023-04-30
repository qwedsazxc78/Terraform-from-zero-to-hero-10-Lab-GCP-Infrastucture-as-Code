##################################################################################
# RESOURCE
##################################################################################
resource "google_storage_bucket" "my-bucket" {
  name          = var.gcs_name
  location      = var.location
  storage_class = "REGIONAL"
  force_destroy = true

  public_access_prevention = "enforced"

  retention_policy {
    retention_period = 3600 * 24 * 30 # 30 days
  }

  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "Delete"
    }
  }
}
