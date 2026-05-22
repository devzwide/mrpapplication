output "resource_group_id" {
  description = "The ID of the created resource group"
  value       = azurerm_resource_group.rg_mrpapplication.id
}

output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.rg_mrpapplication.name
}

output "mrp_network_outputs" {
  description = "Outputs from the network module"
  value       = module.mrp_network
}
