resource "azurerm_virtual_network" "vnet_mrpapplication" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_subnet" "subnet_app" {
  name                 = var.subnet_app_name
  virtual_network_name = azurerm_virtual_network.vnet_mrpapplication.name
  address_prefixes     = var.subnet_app_address_prefix
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "subnet_db" {
  name                 = var.subnet_db_name
  virtual_network_name = azurerm_virtual_network.vnet_mrpapplication.name
  address_prefixes     = var.subnet_db_address_prefix
  resource_group_name  = var.resource_group_name

  delegation {
    name = "postgres-delegation"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_private_dns_zone" "postgres_dns" {
  name                = "${var.environment}-mrp.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_vnet_link" {
  name                  = "link-postgres-to-vnet"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.postgres_dns.name
  virtual_network_id    = azurerm_virtual_network.vnet_mrpapplication.id
  tags                  = var.tags
}
