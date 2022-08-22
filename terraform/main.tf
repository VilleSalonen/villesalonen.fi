terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate9692"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.2.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "static-apps"
  location = "swedencentral"
}

resource "azurerm_dns_zone" "villesalonen" {
  name                = "villesalonen.fi"
  resource_group_name = azurerm_resource_group.rg.name
}
