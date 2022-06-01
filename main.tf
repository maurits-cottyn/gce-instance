provider "google" {
}

module "vm" {
  source    = "../tf-gcp-modules-compute-engine"
  instances = var.vms
  context   = module.this.context
}
