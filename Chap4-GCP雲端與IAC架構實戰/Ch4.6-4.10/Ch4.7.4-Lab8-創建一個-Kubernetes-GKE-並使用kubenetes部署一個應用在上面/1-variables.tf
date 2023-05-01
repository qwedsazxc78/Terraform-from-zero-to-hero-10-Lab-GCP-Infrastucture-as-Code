variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "GCP_REGION" {
  type    = string
  default = "asia-northeast1"
}

variable "cluster_name" {
  type    = string
  default = "gke-tf-ch4-lab8"
}
