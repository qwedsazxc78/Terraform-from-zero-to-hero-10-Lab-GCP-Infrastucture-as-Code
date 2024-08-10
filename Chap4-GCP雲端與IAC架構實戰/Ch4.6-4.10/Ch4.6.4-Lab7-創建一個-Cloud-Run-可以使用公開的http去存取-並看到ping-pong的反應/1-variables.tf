variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "GCP_REGION" {
  type    = string
  default = "asia-northeast1"
}

variable "container_name" {
  type    = string
  default = "cloud-run-tf-ch4-lab-7"
}

variable "image_name" {
  type    = string
  default = "asia-docker.pkg.dev/terraform101-384507/tf-cloud-run/cloud-run-tf-ch4-lab-7:latest"
}
