data "google_storage_bucket" "my_bucket" {
  name = "quick-start-gcs-bucket-variable"
}

output "my_bucket_location" {
  value = data.google_storage_bucket.my_bucket.location
}

output "my_bucket_link" {
  value = data.google_storage_bucket.my_bucket.self_link
}

output "my_bucket_url" {
  value = data.google_storage_bucket.my_bucket.url
}
