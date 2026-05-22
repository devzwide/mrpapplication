terraform {
  cloud {
    organization = "mrpapplication"
    workspaces {
      name = "mrpapplication-workspace"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_cli                    = false
  resource_provider_registrations = "none"
}



locals {
  rg-name = "rg-mrpapplication-${var.environment}-${var.location}"
}

resource "azurerm_resource_group" "rg_mrpapplication" {
  name     = local.rg-name
  location = var.location
  tags     = var.tags
}



