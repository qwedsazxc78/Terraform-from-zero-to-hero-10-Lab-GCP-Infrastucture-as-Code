##################################################################################
# RESOURCE
##################################################################################
resource "google_storage_bucket" "quick_start_gcs" {
  # name          = "quick-start-gcs-bucket"
  name          = "quick-start-gcs-bucket-${terraform.workspace}"
  location      = "asia-east1"
  force_destroy = true
}
