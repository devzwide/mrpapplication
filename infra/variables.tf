variable "environment" {
  description = "The environment for which the infrastructure is being provisioned."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "southafricanorth"
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default = {
    environment = "dev"
    project     = "mrpapplication"
    owner       = "devzwide"
  }
}


variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet-mrp-dev-southafricanorth"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "CIDR block for the Virtual Network."
  default     = ["10.0.0.0/16"]
}

variable "subnet_app_name" {
  description = "The name of the application subnet."
  type        = string
  default     = "snet-app-dev"
}

variable "app_subnet_prefix" {
  type        = list(string)
  description = "CIDR block allocation for the application tier subnet."
  default     = ["10.0.1.0/24"]
}

variable "subnet_db_name" {
  description = "The name of the database subnet."
  type        = string
  default     = "snet-db-dev"
}

variable "db_subnet_prefix" {
  type        = list(string)
  description = "CIDR block allocation for the database tier subnet."
  default     = ["10.0.2.0/24"]
}

variable "db_name" {
  description = "The name of the PostgreSQL server."
  type        = string
  default     = "psql-mrp-dev-southafricanorth"
}

variable "app_database_name" {
  description = "The name of the application database."
  type        = string
  default     = "mrp_production"
}