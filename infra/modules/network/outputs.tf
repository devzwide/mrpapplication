output "vnet_id" {
  value = azurerm_virtual_network.vnet_mrpapplication.id
}

output "app_subnet_id" {
  value = azurerm_subnet.subnet_app.id
}

output "db_subnet_id" {
  value = azurerm_subnet.subnet_db.id
}

output "private_dns_zone_id" {
  description = "The private namespace DNS track tracking ID required for routing VNet-internal data."
  value       = azurerm_private_dns_zone.postgres_dns.id
}