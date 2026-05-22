resource "azurerm_virtual_network" "vnet_mrpapplication" {
  name                = var.virtual_network_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
  address_space       = [var.virtual_network_address_space]
  resource_group_name = azurerm_resource_group.rg_mrpapplication.name
}

resource "azurerm_subnet" "subnet_app" {
  name                 = var.subnet_app_name
  address_prefixes     = [var.subnet_app_address_prefix]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_mrpapplication.name
}

resource "azurerm_subnet" "subnet_db" {
  name                 = var.subnet_db_name
  address_prefixes     = [var.subnet_db_address_prefix]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_mrpapplication.name
}
