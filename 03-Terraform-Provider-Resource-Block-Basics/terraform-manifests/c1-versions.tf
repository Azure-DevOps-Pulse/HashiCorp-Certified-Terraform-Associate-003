# Terraform Block
terraform {
  required_version =  ">= 1.0.0" 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
      #version = "~> 2.0"             
      #version = ">= 2.0.0, < 2.60.0"
      #version = ">= 2.0.0, <= 2.64.0"   
      #version = "~> 2.64" # For Production grade  # pessimistic constraint
      #           ">= 1.0.0"            
    }
  }
}
# Provider Block
provider "azurerm" {
features {}
}

