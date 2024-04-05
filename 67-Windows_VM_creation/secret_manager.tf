/*
data "azurerm_key_vault_secret" "username" {
  name = "hriyen"
  key_vault_id = "/subscriptions/18a0e420-4ca6-47f3-ba52-2534b3c7d2c1/resourceGroups/keyvault-rg/providers/Microsoft.KeyVault/vaults/devopskeyvault001"
}

data "azurerm_key_vault_secret" "password" {
  name = "Adm1n1231Rwq"
  key_vault_id = "/subscriptions/18a0e420-4ca6-47f3-ba52-2534b3c7d2c1/resourceGroups/keyvault-rg/providers/Microsoft.KeyVault/vaults/devopskeyvault001"
}
*/

/*
data "azurerm_client_config" "current" {}
/*
resource "azurerm_resource_group" "myrg" {
  name     = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
}

resource "azurerm_key_vault" "key" {
  name                        = "devopskeyvault001"
  location                    = azurerm_resource_group.myrg.location
  resource_group_name         = azurerm_resource_group.myrg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "username" {
  name         = "username"
  value        = "Hriyen"
  key_vault_id = azurerm_key_vault.key.id
}

resource "azurerm_key_vault_secret" "password" {
  name         = "password"
  value        = "C@lumbi@yesh"
  key_vault_id = azurerm_key_vault.key.id
}
*/