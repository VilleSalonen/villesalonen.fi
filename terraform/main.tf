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

resource "azurerm_dns_ns_record" "villesalonen" {
  name                = "@"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 172800

  records = ["ns1-34.azure-dns.com.", "ns2-34.azure-dns.net.", "ns3-34.azure-dns.org.", "ns4-34.azure-dns.info."]
}

resource "azurerm_dns_mx_record" "mailgun" {
  name                = "@"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 3600

  record {
    preference = 1
    exchange   = "mxa.eu.mailgun.org"
  }

  record {
    preference = 2
    exchange   = "mxb.eu.mailgun.org"
  }
}

resource "azurerm_dns_txt_record" "mailgun" {
  name                = "@"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 3600

  record {
    value = "v=spf1 include:mailgun.org ~all"
  }
}

resource "azurerm_dns_txt_record" "mta_domain_key" {
  name                = "mta._domainkey"
  zone_name           = azurerm_dns_zone.villesalonen.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 3600

  record {
    value = "k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAniue7iAt6B9I7Ck0ainYq6pphynwWNImg9LG8o1jCU4+jLBDM26Au6SKtOph3kDLaKeowr84uYLiWKV7q23p1UTCdEuWqel6hMs1SBXckY7uY/D03Lv2dYJnXPoEWv7jGKxdw7/sK4ragYiPBu7tEGA/lO7kX6mykPoNrufBxJ/CjW5HFBgBeBdUD2fPLk0Oz35YOgY7hZk1+tW8ZNuo5Kj4AjqYHAdKn01XNgsEtkkN9xrQzsWjZhIOXuJCH9G4sXlnaMwWwcgY9Lce3YVBMlQFIBaHfm7gJzka6nGzwGOk/M/zoueAAK/F3glXGLXWHxpWQCR7bBsrehSqaJhTmQIDAQAB"
  }
}
