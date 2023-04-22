# # 嚴格等於（exact match）
# provider "google" {
#   version = "3.19.0"
#   region  = "us-west-2"
# }

# # 最小版本（minimum version）
# provider "google" {
#   version = ">= 0.11.0"
#   region  = "us-west-2"
# }

# # 指定版本範圍（version range）
# provider "google" {
#   version = ">= 3.5.0, < 4.0.0"
#   region  = "us-west-2"
# }

# # 通配符（wildcard）
# provider "google" {
#   version = "3.*"
#   region  = "us-west-2"
# }

# # 任何版本（any version）
# provider "google" {
#   version = "any"
#   region  = "us-west-2"
# }
