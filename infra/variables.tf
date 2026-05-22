variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "southafricanorth"
}

variable "environment" {
  description = "The environment for which the infrastructure is being provisioned."
  type        = string
  default     = "dev"
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

variable "resource_group_name" {
  default     = "rg-mrpapplication-dev-southafricanorth"
  description = "The name of the resource group to create."
  type        = string
}

variable "vnet_address_space" {
  type        = string
  description = "CIDR block for the Virtual Network."
  default     = "10.0.0.0/16"
}

variable "app_subnet_prefix" {
  type        = string
  description = "CIDR block allocation for the application tier subnet."
  default     = "10.0.1.0/24"
}

variable "db_subnet_prefix" {
  type        = string
  description = "CIDR block allocation for the database tier subnet."
  default     = "10.0.2.0/24"
}