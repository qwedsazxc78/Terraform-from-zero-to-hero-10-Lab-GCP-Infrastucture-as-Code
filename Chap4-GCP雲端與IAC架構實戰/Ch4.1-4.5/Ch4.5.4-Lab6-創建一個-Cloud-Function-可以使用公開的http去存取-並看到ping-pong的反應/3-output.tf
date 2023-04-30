output "bucket_name" {
  value = google_storage_bucket.cloud_function_bucket.name
}

output "cloud_function_https_trigger_url" {
  value = google_cloudfunctions_function.hello_function.https_trigger_url
}
