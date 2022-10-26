terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.6.0"
    }
  }
}
#   #backend state file in an azure storage account
#   backend "azurerm" {
#     resource_group_name  = "dlussier-training"
#     storage_account_name = "dlussiertraining"
#     container_name       = "terra-challenge"
#     key                  = "terraform.tfstate"
#   }

# }


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
