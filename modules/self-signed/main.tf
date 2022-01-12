resource "tls_private_key" "root" {
  algorithm = "ECDSA"
}

resource "tls_self_signed_cert" "root" {
  key_algorithm   = "ECDSA"
  private_key_pem = tls_private_key.root.private_key_pem

  subject {
    common_name  = "devops-stack.camptocamp.com"
    organization = "Camptocamp, SA"
  }

  validity_period_hours = 8760

  allowed_uses = [
    "cert_signing",
  ]

  is_ca_certificate = true
}


module "cert-manager" {
  source = "../"

  cluster_name = var.cluster_name
  base_domain  = var.base_domain
  oidc         = var.oidc
  argocd       = var.argocd

  namespace      = var.namespace
  profiles       = var.profiles

  cert_manager   = var.cert_manager

  extra_yaml = [ templatefile("${path.module}/values.yaml", {
    root_cert    = base64encode(tls_self_signed_cert.root.cert_pem)
    root_key     = base64encode(tls_private_key.root.private_key_pem)
  }) ]
}
