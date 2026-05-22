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

  virtual_network_name          = "vnet-mrp-${var.environment}"
  virtual_network_address_space = var.vnet_address_space
  subnet_app_name               = "snet-app-${var.environment}"
  subnet_app_address_prefix     = var.app_subnet_prefix
  subnet_db_name                = "snet-db-${var.environment}"
  subnet_db_address_prefix      = var.db_subnet_prefix
}

module "mrp_database" {
  source              = "./modules/database"
  resource_group_name = azurerm_resource_group.rg_mrpapplication.name
  environment         = var.environment
  location            = var.location
  tags                = var.tags

  db_name             = "psql-mrp-${var.environment}-${var.location}"
  app_database_name   = "mrp_production"
  db_subnet_id        = module.mrp_network.subnet_db_id
  private_dns_zone_id = module.mrp_network.private_dns_zone_id
}