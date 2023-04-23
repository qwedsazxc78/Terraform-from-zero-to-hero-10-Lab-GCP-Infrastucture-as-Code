##################################################################################
# RESOURCE
##################################################################################
resource "random_string" "cluster_service_account_suffix" {
  upper   = false
  lower   = true
  special = false
  length  = 4
}

resource "google_storage_bucket" "quick_start_gcs_a" {
  name          = "quick-start-gcs-bucket-a-${random_string.cluster_service_account_suffix.result}"
  location      = "asia-east1"
  force_destroy = true

  labels = {
    lifecycle : "original"
  }
}

# 1. try to add labels
# 2. try to rename
# 3. comment prevent_destroy = true
# 4. deploy and change labels
resource "google_storage_bucket" "quick_start_gcs_b" {
  name = "quick-start-gcs-bucket-b-${random_string.cluster_service_account_suffix.result}"
  # name          = "quick-start-gcs-bucket-b-new"
  location      = "asia-east1"
  force_destroy = true

  labels = {
    lifecycle : "add-lifecycle"
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to the instance labels
      labels,
    ]
    # prevent_destroy = true
  }
}
