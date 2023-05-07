variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "GCP_REGION" {
  type    = string
  default = "asia-northeast1"
}

variable "GCP_ZONE" {
  type    = string
  default = "asia-northeast1-a"
}

variable "redis_name" {
  type    = string
  default = "redis-tf-ch4-12-3"
}
