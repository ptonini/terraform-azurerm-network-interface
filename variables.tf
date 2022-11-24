variable "name" {}

variable "rg" {}

variable "subnet_id" {}

variable "security_group_id" {}

variable "public_ip" {
  default = false
  type = bool
}

variable "public_ip_sku" {
  default = "Standard"
}

variable "public_ip_allocation_method" {
  default = "Static"
}

variable "public_ip_zones" {
  default = [1, 2, 3]
}