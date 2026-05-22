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