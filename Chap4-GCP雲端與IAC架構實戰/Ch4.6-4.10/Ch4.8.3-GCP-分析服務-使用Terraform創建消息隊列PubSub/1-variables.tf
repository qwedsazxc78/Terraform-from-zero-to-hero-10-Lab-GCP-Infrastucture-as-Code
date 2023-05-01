variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
  default     = "terraform101-384507"
}

variable "GCP_REGION" {
  type    = string
  default = "asia-northeast1"
}

variable "topic_name" {
  type    = string
  default = "pubsub-topic-tf-ch4-8-3"
}

variable "subscription_name" {
  type    = string
  default = "pubsub-sub-tf-ch4-8-3"
}
