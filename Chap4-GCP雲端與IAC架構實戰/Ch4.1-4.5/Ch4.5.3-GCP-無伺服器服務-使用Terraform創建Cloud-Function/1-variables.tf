variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "GCP_REGION" {
  type    = string
  default = "asia-northeast1"
}

variable "instance_name" {
  type    = string
  default = "vm-tf-ch4-4-3"
}
