variable "resource_group_name" {
  description = "The name of the resource group where the database will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "environment" {
  description = "The environment for which the infrastructure is being provisioned."
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
}

variable "db_name" {
  description = "The name of the PostgreSQL database instance."
  type        = string
}

variable "app_database_name" {
  type        = string
  description = "The target schema production logical database instance name."
}

variable "db_version" {
  description = "The version of PostgreSQL to use."
  type        = string
  default     = "14"
}

variable "db_subnet_id" {
  description = "The ID of the pre-configured subnet where the PostgreSQL server will be injected."
  type        = string
}

variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone required for VNet-integrated flexible servers."
  type        = string
}

variable "db_admin_username" {
  description = "The administrator username for the PostgreSQL server."
  type        = string
  default     = "mrpadmin"
}

variable "zone" {
  description = "The specific availability zone for the PostgreSQL server."
  type        = string
  default     = null
}

variable "sku_name" {
  description = "The SKU pricing tier performance allocation for the PostgreSQL server."
  type        = string
  default     = "B_Standard_B1ms"
}

variable "storage_mb" {
  description = "Max storage allowed for the PostgreSQL Flexible Server in MB."
  type        = number
  default     = 32768
}