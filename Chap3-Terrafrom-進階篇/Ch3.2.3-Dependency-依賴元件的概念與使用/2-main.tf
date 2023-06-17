##################################################################################
# RESOURCE
##################################################################################
resource "google_storage_bucket" "quick_start_gcs_a" {
  name          = "quick-start-gcs-bucket-a"
  location      = "asia-east1"
  force_destroy = true
}

resource "google_storage_bucket" "quick_start_gcs_b" {
  name          = "quick-start-gcs-bucket-b"
  location      = "asia-east1"
  force_destroy = true

  depends_on = [
    google_storage_bucket.quick_start_gcs_a
  ]
}
