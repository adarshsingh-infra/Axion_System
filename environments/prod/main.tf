module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "storage" {
  depends_on       = [module.rg]
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storages
}