terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">=3.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.3.2"
    }
    null = {
      source = "hashicorp/null"
      version = ">= 3.1.1"
    }  
  }
  backend "azurerm" {
    
  }
}

provider "azurerm" {
  features {}
}

