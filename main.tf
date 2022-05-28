provider "google" {
}

module "vpc" {
  source    = "../tf-gcp-modules-network-vpc"
  vpc       = var.vpc
  firewalls = var.firewalls
  context   = module.this.context
}

module "vm" {
  source    = "../tf-gcp-modules-compute-engine"
  instances = var.vms
  context   = module.this.context
}
