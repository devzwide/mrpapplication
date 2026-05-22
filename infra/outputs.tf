output "resource_group_id" {
  description = "The ID of the created resource group"
  value       = azurerm_resource_group.rg_mrpapplication.id
}

output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.rg_mrpapplication.name
}

output "vnet_id" {
  description = "The ID of the managed Virtual Network inside the network module"
  value       = module.mrp_network.vnet_id
}

output "db_admin_password" {
  description = "The password generated dynamically for the master administrator schema account."
  value       = module.mrp_database.admin_password
  sensitive   = true
}