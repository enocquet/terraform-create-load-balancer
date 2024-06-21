variable "helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "helm_release_name" {
  type    = string
  default = "metallb"
}

variable "metallb_version" {
  type    = string
  default = "6.3.5"
}

variable "namespace" {
  type    = string
  default = "metallb-system"
}

variable "monitoring_namespace" {
  type    = string
  default = ""
}

variable "ip_address_pool" {
  type        = string
  description = <<-EOT
    The IP address pool to use for MetalLB. This should be a list of IP addresses in CIDR notation.
    Take care to ensure that the IP addresses are not already in use on your network.
    The var is a string so quote should be escaped, e.g :
    "[\"10.0.20.0/24\", \"10.0.22.3/32\"]"
  EOT
}
