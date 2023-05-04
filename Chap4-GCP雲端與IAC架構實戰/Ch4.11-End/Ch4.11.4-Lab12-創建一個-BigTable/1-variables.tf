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

variable "bigtable_name" {
  type    = string
  default = "bigtable-tf-ch4-11-3"
}

variable "table_name" {
  type    = string
  default = "table-tf-ch4-11-3"
}
