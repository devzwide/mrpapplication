output "vnet_id" {
  value = azurerm_virtual_network.vnet_mrpapplication.id
}

output "app_subnet_id" {
  value = azurerm_subnet.subnet_app.id
}

output "db_subnet_id" {
  value = azurerm_subnet.subnet_db.id
}