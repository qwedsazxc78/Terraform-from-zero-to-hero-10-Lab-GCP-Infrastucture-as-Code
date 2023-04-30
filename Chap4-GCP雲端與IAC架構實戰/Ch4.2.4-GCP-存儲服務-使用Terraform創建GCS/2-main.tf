##################################################################################
# RESOURCE
##################################################################################
resource "google_storage_bucket" "my-bucket" {
  name          = var.gcs_name
  location      = var.location
  storage_class = "MULTI_REGIONAL"
  force_destroy = true

  public_access_prevention = "enforced"

  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "Delete"
    }
  }
}
