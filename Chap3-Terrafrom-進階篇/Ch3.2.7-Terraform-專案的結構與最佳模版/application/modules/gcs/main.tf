##################################################################################
# RESOURCE
##################################################################################
resource "google_storage_bucket" "module-gcs" {
  name          = var.gcs_name
  location      = var.location
  force_destroy = true
}
