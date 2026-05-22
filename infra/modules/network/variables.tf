variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

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

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "mrpapp-vnet"
}

variable "virtual_network_address_space" {
  description = "The address space for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_app_name" {
  description = "The name of the application subnet."
  type        = string
  default     = "app-subnet"
}

variable "subnet_app_address_prefix" {
  description = "The address prefix for the application subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_db_name" {
  description = "The name of the database subnet."
  type        = string
  default     = "db-subnet"
}

variable "subnet_db_address_prefix" {
  description = "The address prefix for the database subnet."
  type        = string
  default     = "10.0.2.0/24"
}