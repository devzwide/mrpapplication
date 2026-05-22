output "server_id" {
  description = "The Resource ID of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.postgres.id
}

output "fqdn" {
  description = "The Fully Qualified Domain Name of the PostgreSQL Flexible Server used for application connection strings."
  value       = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "database_name" {
  description = "The name of the default application database."
  value       = azurerm_postgresql_flexible_server_database.mrp_db.name
}

output "admin_username" {
  description = "The administrator login name for the database server."
  value       = var.db_admin_username
}

output "admin_password" {
  description = "The generated administrator master password."
  value       = random_password.db_password.result
  sensitive   = true
}

output "db_admin_password" {
  description = "The password generated dynamically for the master administrator schema account."
  value       = module.mrp_database.admin_password
  sensitive   = true
}