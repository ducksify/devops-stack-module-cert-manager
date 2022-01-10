variable "cluster_name" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "base_domain" {
  type = string
}

variable "oidc" {
  type    = any
  default = {}
}

variable "cluster_oidc_issuer_url" {
  type = string
}
