terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.96.0"
    }
  }

  cloud {
    organization = "nmbrs"
    workspaces {
      name = "demo-tf-multirepo-bdd-development"
    }
  }

  required_version = ">= 1.0.0"
}
