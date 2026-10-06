module "rg" {
  source = "../../modules/resource_group"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/subnet"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.rg]
  source     = "../../modules/public_ip"
  public_ips = var.public_ips
}

module "vms" {
  depends_on       = [module.subnet, module.pips]
  source           = "../../modules/virtual_machine"
  virtual_machines = var.virtual_machines
}

module "postgressql" {
  depends_on         = [module.rg, module.subnet]
  source             = "../../modules/postgres_server"
  postgresql_servers = var.postgresql_servers
}