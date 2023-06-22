variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "gcs_name" {
  type    = string
  default = "gcs-tf-lab3"
}

variable "location" {
  type    = string
  default = "asia-east1"
}
