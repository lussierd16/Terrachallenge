# task 1 create resource group :p

resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.location
}


# Locals
locals {

  vnet_name = "${var.company}_${var.location}_${var.environment}_vnet"

}

module "vnet" {
  source              = "./modules/vnet"
  name                = local.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  subnets             = var.subnets
  tags                = var.tags
}