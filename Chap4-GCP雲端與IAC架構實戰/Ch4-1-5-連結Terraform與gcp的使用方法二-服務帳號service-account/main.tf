# 記得不要上傳你的service account 檔案
provider "google" {
  credentials = file("tf101-sa.json")
  project     = "terraform101-384507"
  region      = "asia-east1"
}

resource "google_storage_bucket" "quick-start-gcs" {
  name          = "quick-start-gcs-bucket"
  location      = "asia-east1"
  force_destroy = true
}
