# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  for_each = {
    AzureDevOpsPulse01 = "eastus"
    AzureDevOpsPulse02 = "eastus2"
    AzureDevOpsPulse03 = "westus"
  }
  name = "${each.key}-rg"
  location = each.value 
}