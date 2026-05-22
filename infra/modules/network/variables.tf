variable "resource_group_name" {
  description = "The name of the resource group to create."
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

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "subnet_app_name" {
  description = "The name of the application subnet."
  type        = string
}

variable "subnet_app_address_prefix" {
  description = "The address prefix for the application subnet."
  type        = list(string)
}

variable "subnet_db_name" {
  description = "The name of the database subnet."
  type        = string
}

variable "subnet_db_address_prefix" {
  description = "The address prefix for the database subnet."
  type        = list(string)
}