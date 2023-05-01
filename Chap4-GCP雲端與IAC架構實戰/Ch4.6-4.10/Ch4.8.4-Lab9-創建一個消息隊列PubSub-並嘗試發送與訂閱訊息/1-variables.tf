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
  default = "pubsub-topic-tf-ch4-lab9"
}

variable "subscription_name_a" {
  type    = string
  default = "pubsub-sub-tf-ch4-lab9-a"
}

variable "subscription_name_b" {
  type    = string
  default = "pubsub-sub-tf-ch4-lab9-b"
}
