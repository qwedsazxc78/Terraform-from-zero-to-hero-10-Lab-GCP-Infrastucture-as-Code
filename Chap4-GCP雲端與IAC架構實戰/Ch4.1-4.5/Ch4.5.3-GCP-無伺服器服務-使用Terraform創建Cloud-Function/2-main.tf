##################################################################################
# RESOURCE
##################################################################################
resource "google_cloudfunctions_function" "hello_function" {
  name                = "hello-function"
  description         = "An hello Cloud Function"
  runtime             = "python39"
  available_memory_mb = 256
  timeout             = 60

  source_archive_bucket = google_storage_bucket.cloud_function_bucket.name
  source_archive_object = "hello_function.zip"

  trigger_http = true
  entry_point  = "handler"

  environment_variables = {
    FOO = "bar"
  }

  labels = {
    env = "dev"
  }
  depends_on = [
    google_storage_bucket.cloud_function_bucket
  ]
}

# 使用random產生亂數
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

# 產生存放程式碼的GCS
resource "google_storage_bucket" "cloud_function_bucket" {
  name     = "cloud-function-bucket-${random_id.bucket_prefix.hex}"
  location = "ASIA"
}

# 將特定路徑壓縮成zip檔案
data "archive_file" "src" {
  type        = "zip"
  source_dir  = "${path.root}/src/" # Directory where your Python source code is
  output_path = "${path.root}/generated/hello_function.zip"
}

# 將zip上傳到GCP上，提供cloud function部署
resource "google_storage_bucket_object" "archive" {
  name   = "${data.archive_file.src.output_md5}.zip"
  bucket = google_storage_bucket.cloud_function_bucket.name
  source = data.archive_file.src.output_path

  metadata = {
    ManagedBy = "Terraform"
  }
}

output "bucket_name" {
  value = google_storage_bucket.cloud_function_bucket.name
}

output "cloud_function_https_trigger_url" {
  value = google_cloudfunctions_function.hello_function.https_trigger_url
}
