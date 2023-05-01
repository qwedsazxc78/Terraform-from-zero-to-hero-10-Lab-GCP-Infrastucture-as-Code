variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "GCP_REGION" {
  type    = string
  default = "asia-northeast1"
}

variable "bigquery_name" {
  type = string
  # bq 命名規則
  default = "bq_tf_ch4_9_3"
}
