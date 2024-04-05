# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  for_each = var.RG_locations

  name     = "myrg-${each.key}-01"
  location = each.value
}


/*

# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  for_each = toset([ "dev", "test", "prod" ])        # ([ "eastus", "eastus2", "westus" ])
  name = "myrg-${each.value}-01" 
  location = var.RG_locations
}
/* 
we can also use each.value as each.key = each.value 
in this case  
*/