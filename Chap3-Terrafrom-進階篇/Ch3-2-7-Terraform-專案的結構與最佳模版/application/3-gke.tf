##################################################################################
# RESOURCES
##################################################################################
# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

data "google_compute_default_service_account" "default" {}

module "gke" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
  project_id = var.GCP_PROJECT
  name       = var.cluster_name
  region     = local.region
  zones      = local.zones
  regional   = local.regional

  network_project_id      = local.vpc_host_project
  network                 = local.vpc
  subnetwork              = local.vpc_subnet
  ip_range_pods           = local.vpc_ip_range_pods
  ip_range_services       = local.vpc_ip_range_services
  enable_private_endpoint = false
  enable_private_nodes    = true
  disable_default_snat    = true
  dns_cache               = true

  create_service_account = false
  service_account        = data.google_compute_default_service_account.default.email

  # use our spot pool
  remove_default_node_pool = true
  http_load_balancing      = true
  enable_l4_ilb_subsetting = true
  network_policy           = true
  enable_cost_allocation   = true
  gce_pd_csi_driver        = true
  config_connector         = true
  filestore_csi_driver     = false

  kubernetes_version              = local.kubernetes_version
  horizontal_pod_autoscaling      = local.hpa
  enable_vertical_pod_autoscaling = local.vpa
  cluster_autoscaling             = local.cluster_autoscaling
  master_authorized_networks      = local.authorized_networks

  node_pools = [
    {
      name               = local.default_pool_name
      machine_type       = local.default_pool_node_type
      min_count          = local.default_pool_min_count
      max_count          = local.default_pool_max_count
      spot               = local.default_pool_spot_type
      disk_size_gb       = local.default_pool_disk_size_gb
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      auto_repair        = true
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }

  cluster_resource_labels = local.common_label

  node_pools_labels = {
    all = local.common_label

    spot-worker-pool = {
      spot-worker-pool = true
    }
  }

  node_pools_metadata = {
    all = local.common_label

    spot-worker-pool = {
      node-pool-metadata-custom-value = "spot-worker-pool"
    }
  }
  node_pools_resource_labels = {
    all = local.common_label

    spot-worker-pool = {
      node-pool-metadata-custom-value = "spot-worker-pool"
    }
  }
  node_pools_taints = {
    all = []

    spot-worker-pool = [
      {
        key    = "spot-worker-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    spot-worker-pool = [
      "spot-worker-pool"
    ]
  }
}
