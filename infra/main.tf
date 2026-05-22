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

  use_cli                         = false
  resource_provider_registrations = "none"
}


resource "azurerm_resource_group" "rg_mrpapplication" {
  name     = "rg-mrpapplication-${var.environment}-${var.location}"
  location = var.location
  tags     = var.tags
}


module "mrp_network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg_mrpapplication.name
  environment         = var.environment
  location            = var.location
  tags                = var.tags
}
