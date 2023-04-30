output "bucket_name" {
  value = google_storage_bucket.module-gcs.name
}

output "bucket_location" {
  value = google_storage_bucket.module-gcs.location
}
