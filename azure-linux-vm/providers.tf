terraform {
  required_version = ">=1.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.52"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
