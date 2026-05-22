resource "random_password" "db_password" {
  length           = 24
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = var.db_version

  public_network_access_enabled = false
  delegated_subnet_id           = var.db_subnet_id
  private_dns_zone_id           = var.private_dns_zone_id

  administrator_login    = var.db_admin_username
  administrator_password = random_password.db_password.result

  zone = var.zone

  sku_name   = var.sku_name
  storage_mb = var.storage_mb

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "mrp_db" {
  name      = var.app_database_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

