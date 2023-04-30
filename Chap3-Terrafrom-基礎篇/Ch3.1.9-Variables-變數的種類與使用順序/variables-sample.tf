# 字串變數（String variables）：用於定義字符串值的變數
variable "region" {
  type    = string
  default = "us-west1"
}

# 數字變數（Number variables）：用於定義數字值的變數
variable "instance_count" {
  type    = number
  default = 2
}

# 布林變數（Boolean variables）：用於定義布林值（True 或 False）的變數
variable "use_ssl" {
  type    = bool
  default = true
}

# 列表變數（List variables）：用於定義多個值的變數
variable "tags" {
  type    = list(string)
  default = ["web", "dev", "app"]
}

# 映射變數（Map variables）：用於定義鍵值對（Key-Value Pairs）的變數
variable "region_zone_map" {
  type = map(string)
  default = {
    us-west1 = "us-west1-a"
    us-west2 = "us-west2-a"
    us-east1 = "us-east1-b"
  }
}

variable "token" {
  type = string
}
