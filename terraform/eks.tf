module "eks" {
  count = var.profile == "eks" ? 1 : 0

  source = "./eks"

  cluster_name            = var.cluster_name
  base_domain             = var.base_domain
  cluster_oidc_issuer_url = module.cluster.cluster_oidc_issuer_url
  cluster_id              = module.cluster.cluster_id
}
