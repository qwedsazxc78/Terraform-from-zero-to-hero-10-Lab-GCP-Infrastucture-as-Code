##################################################################################
# RESOURCE
##################################################################################
resource "google_storage_bucket" "quick_start_gcs" {
  name          = "quick-start-gcs-bucket"
  location      = "asia-east1"
  force_destroy = true
}
