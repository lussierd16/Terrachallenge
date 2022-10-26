variable "name" {
  description = "(Required) Name of the virtual network to be created. Changing this forces a new resource to be created. "
  type        = string
}
variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. "
  type        = string
}
variable "location" {
  description = "(Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
variable "address_space" {
  description = "VNET address space"
  type        = list(string)
}
variable "subnets" {
  description = "Subnets configuration"
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each             = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = lookup(each.value, "address_prefixes", [])
}

output "vnet_id" {
  description = "Generated VNET ID"
  value       = azurerm_virtual_network.vnet.id
}
output "resource_group_name" {
  description = "RG of the vNet"
  value       = azurerm_virtual_network.vnet.resource_group_name
}
output "name" {
  description = "RG of the vNet"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  description = "Generated subnet IDs map"
  # value       = { for subnet in azurerm_subnet.subnet : subnet.name => subnet.id }
  value = { for subnet in azurerm_subnet.subnet : subnet.name => subnet }
}

output "address_prefixes" {
  description = "Subnet Address Range"
  value       = { for subnet in azurerm_subnet.subnet : subnet.name => subnet }

}