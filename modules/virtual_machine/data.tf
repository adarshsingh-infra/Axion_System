data "azurerm_subnet" "subnets" {
  for_each = var.virtual_machines

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pips" {
  for_each            = var.virtual_machines

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}