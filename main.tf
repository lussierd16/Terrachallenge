# task 1 create resource group :p

# Locals
locals {

  vnet_name = "${var.company}_${var.location}_${var.environment}_vnet"

}

# Resource Group
module "shared_rg" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source              = "./modules/vnet"
  name                = local.vnet_name
  address_space       = var.address_space
  location            = module.shared_rg.location
  resource_group_name = module.shared_rg.name
  subnets             = var.subnets
  tags                = var.tags
}