##################################################################################
# RESOURCE
##################################################################################
resource "google_bigtable_instance" "this" {
  name = var.bigtable_name

  deletion_protection = false

  # a cluster with auto scaling.
  cluster {
    cluster_id   = "${var.bigtable_name}-auto"
    storage_type = "HDD"
    zone         = var.GCP_ZONE

    autoscaling_config {
      min_nodes  = 1
      max_nodes  = 3
      cpu_target = 50
    }
  }
}

# 建立 Cloud Bigtable 表格
resource "google_bigtable_table" "example_table" {
  instance_name = google_bigtable_instance.this.name
  name          = var.table_name

  column_family {
    family = "family-first"
  }

  column_family {
    family = "family-second"
  }
}
