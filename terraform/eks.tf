module "eks" {
  count = var.profile == "eks" ? 1 : 0

  source = "./eks"
}
