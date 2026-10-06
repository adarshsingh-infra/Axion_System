terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-devopsinsiders"
    storage_account_name = "distorage7866"
    container_name       = "prod-tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}