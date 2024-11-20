output "bucket_name" {
  value = google_storage_bucket.quick_start_gcs.name
}

output "bucket_location" {
  value = google_storage_bucket.quick_start_gcs.location
}
