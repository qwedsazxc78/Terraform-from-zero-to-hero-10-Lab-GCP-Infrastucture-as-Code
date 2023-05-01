##################################################################################
# RESOURCE
##################################################################################
resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.container_name
  location = var.GCP_REGION
  template {
    spec {
      containers {
        # 下載檔案 docker hub - https://hub.docker.com/_/nginx
        image = var.image_name
        ports {
          name           = "http1"
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# IAM 所有人都可以去access
resource "google_cloud_run_service_iam_member" "public_access" {
  location = google_cloud_run_service.cloud_run_service.location
  project  = google_cloud_run_service.cloud_run_service.project
  service  = google_cloud_run_service.cloud_run_service.name

  role   = "roles/run.invoker"
  member = "allUsers"
}

output "cloud_run_url" {
  value = google_cloud_run_service.cloud_run_service.status[0].url
}
