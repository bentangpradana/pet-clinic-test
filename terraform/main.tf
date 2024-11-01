module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  subnetwork_name = var.subnetwork_name
  subnet_cidr    = var.subnet_cidr
  region          = var.region
  project_id      = var.project_id
}

module "firewall" {
  source     = "./modules/firewall"
  vpc_name   = module.vpc.network_name
  project_id = var.project_id
}

module "vm" {
  source            = "./modules/vm"
  project_id       = var.project_id
  vpc_name         = module.vpc.network_name
  subnetwork_name  = module.vpc.subnet_name
  zone             = var.zone
  vm_machine_type  = var.vm_machine_type
  prefix           = var.prefix
}

module "bucket" {
  source        = "./modules/bucket"
  project_id    = var.project_id
  region        = var.region
  bucket_name   = "${var.project_id}-tfstate"
}