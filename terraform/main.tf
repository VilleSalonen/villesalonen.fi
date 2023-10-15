terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate12934"
    container_name       = "tfstate"
    key                  = "villesalonenfi/terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.19.1"
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
  name                = "ville-salonen"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
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

resource "azurerm_dns_cname_record" "www" {
  name                = "www"
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

resource "azurerm_dns_mx_record" "mx" {
  name                = "@"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 3600

  record {
    preference = 10
    exchange   = "in1-smtp.messagingengine.com."
  }

  record {
    preference = 20
    exchange   = "in2-smtp.messagingengine.com."
  }

  depends_on = [
    azurerm_dns_zone.villesalonen
  ]
}

resource "azurerm_dns_cname_record" "cname1" {
  name                = "fm1._domainkey"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  record              = "fm1.villesalonen.fi.dkim.fmhosted.com."
}

resource "azurerm_dns_cname_record" "cname2" {
  name                = "fm2._domainkey"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  record              = "fm2.villesalonen.fi.dkim.fmhosted.com."
}

resource "azurerm_dns_cname_record" "cname3" {
  name                = "fm3._domainkey"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  record              = "fm3.villesalonen.fi.dkim.fmhosted.com."
}

resource "azurerm_dns_txt_record" "txt" {
  name                = "@"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300

  record {
    value = "v=spf1 include:spf.messagingengine.com ?all"
  }
}
