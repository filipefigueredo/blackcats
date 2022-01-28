terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  cloud {
    organization = "nmbrs"
    workspaces {
      name = "ffs-teste"
    }
  }

  required_version = ">= 1.0.0"
}
