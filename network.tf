module "network_module" {
  source         = "./network_module"
  vpc_cidr_block = var.vpc_cidr_block
  subnets        = var.subnets
  region         = var.region
}