terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}

provider "azurerm" {
  features {}
}

# 1. Tenant & Management Group Hierarchy
module "management_groups" {
  source                     = "./modules/management_groups"
  root_management_group_id   = var.root_management_group_id
  root_management_group_name = var.root_management_group_name
}

# 2. Central Hub Network & Firewall Egress
module "hub_network" {
  source              = "./modules/hub_networking"
  resource_group_name = "rg-hub-connectivity-${var.environment}"
  location            = var.location
  hub_vnet_name       = "vnet-hub-${var.environment}"
  tags                = var.common_tags
}

# 3. Workload Spoke Network & Peering
module "spoke_network_prod" {
  source                  = "./modules/spoke_networking"
  resource_group_name     = "rg-spoke-workloads-prod"
  location                = var.location
  spoke_vnet_name         = "vnet-spoke-prod"
  hub_vnet_id             = module.hub_network.hub_vnet_id
  hub_vnet_name           = module.hub_network.hub_vnet_name
  hub_resource_group_name = "rg-hub-connectivity-${var.environment}"
  hub_route_table_id      = module.hub_network.spoke_route_table_id
  tags                    = var.common_tags
}

