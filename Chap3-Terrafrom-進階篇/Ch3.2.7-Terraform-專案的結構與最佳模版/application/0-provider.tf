##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_version = ">=1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.40.0"
    }
  }
}

##################################################################################
# PROVIDERS
##################################################################################
provider "google" {
  project = var.GCP_PROJECT
  # region  = var.GCP_REGION
  # zone        = var.zone
}

##################################################################################
# Backend
##################################################################################
terraform {
  backend "http" {
  }
}

##################################################################################
# GKE and Helm package
##################################################################################
provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  token                  = data.google_client_config.default.access_token
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}
