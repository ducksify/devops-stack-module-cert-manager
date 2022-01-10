module "eks" {
  count = contains(var.profiles, "eks") ? 1 : 0

  source = "./eks"

  cluster_name            = var.cluster_name
  base_domain             = var.base_domain
  cluster_oidc_issuer_url = var.cert-manager.cluster_oidc_issuer_url
}
