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

resource "azurerm_static_site" "villesalonen" {
  name                     = "ville-salonen"
  resource_group_name = azurerm_resource_group.rg.name
  location                 = "westeurope"
}

resource "azurerm_dns_zone" "villesalonen" {
  name                = "villesalonen.fi"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_dns_a_record" "villesalonen" {
  name                = "@"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 3600
  target_resource_id  = azurerm_static_site.villesalonen.id
}

resource "azurerm_dns_ns_record" "villesalonen" {
  name                = "@"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 172800

  records = ["ns1-34.azure-dns.com.", "ns2-34.azure-dns.net.", "ns3-34.azure-dns.org.", "ns4-34.azure-dns.info."]
}
