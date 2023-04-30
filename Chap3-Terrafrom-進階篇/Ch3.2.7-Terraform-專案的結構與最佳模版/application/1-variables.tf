variable "GCP_PROJECT" {
  description = "GCP Project ID"
  type        = string
}

variable "WORKSPACE_ENV" {
  type    = string
  default = "dev"
}

variable "ARGOCD_ADMIN_PASSWORD" {
  type = string
}

variable "GITLB_RUNNER_TOKEN" {
  type = string
}
