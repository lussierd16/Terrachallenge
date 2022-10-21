# task 1 create resource group :p

resource "azurerm_resource_group" "rg1" {
  name     = "rg-tftraining-dlussier"
  location = var.location
}