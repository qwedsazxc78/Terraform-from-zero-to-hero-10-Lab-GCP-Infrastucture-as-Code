##################################################################################
# RESOURCE
##################################################################################
resource "google_storage_bucket" "quick_start_gcs" {
  name          = var.gcs_name
  location      = var.location
  force_destroy = true
}
