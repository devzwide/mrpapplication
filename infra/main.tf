resource "azurerm_resource_group" "rg_mrpapplication" {
  name     = "rg-mrpapplication-${var.environment}-${var.location}"
  location = var.location
  tags     = var.tags
}


module "mrp_network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.rg_mrpapplication.name
  environment         = var.environment
  location            = var.location
  tags                = var.tags

  virtual_network_name          = var.vnet_name
  virtual_network_address_space = var.vnet_address_space

  subnet_app_name           = var.subnet_app_name
  subnet_app_address_prefix = var.app_subnet_prefix

  subnet_db_name           = var.subnet_db_name
  subnet_db_address_prefix = var.db_subnet_prefix
}

module "mrp_database" {
  source = "./modules/database"

  resource_group_name = azurerm_resource_group.rg_mrpapplication.name
  environment         = var.environment
  location            = var.location
  tags                = var.tags

  db_name           = var.db_name
  app_database_name = var.app_database_name

  db_subnet_id        = module.mrp_network.subnet_db_id
  private_dns_zone_id = module.mrp_network.private_dns_zone_id
}