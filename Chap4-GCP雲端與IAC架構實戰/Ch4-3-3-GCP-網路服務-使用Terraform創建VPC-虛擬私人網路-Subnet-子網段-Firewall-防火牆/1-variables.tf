variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "network_name" {
  type    = string
  default = "vpc-tf-ch4-3-3"
}

variable "location" {
  type    = string
  default = "asia-east1"
}
