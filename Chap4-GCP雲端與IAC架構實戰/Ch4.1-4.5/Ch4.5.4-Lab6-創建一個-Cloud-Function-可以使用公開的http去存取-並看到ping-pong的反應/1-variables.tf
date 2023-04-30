variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "GCP_REGION" {
  type    = string
  default = "asia-northeast1"
}

variable "func_name" {
  type    = string
  default = "cloud-function-tf-ch4-lab6"
}
