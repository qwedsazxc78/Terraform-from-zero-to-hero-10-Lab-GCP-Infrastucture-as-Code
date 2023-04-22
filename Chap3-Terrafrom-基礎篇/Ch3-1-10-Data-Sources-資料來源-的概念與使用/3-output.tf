output "bucket_name" {
  value = google_storage_bucket.quick-start-gcs.name
}

output "bucket_location" {
  value = google_storage_bucket.quick-start-gcs.location
}
