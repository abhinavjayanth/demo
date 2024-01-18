resource "azurerm_storage_account" "example" {
  name                     = var.storage-name
  resource_group_name      = var.name
  location                 = var.location
  account_tier             = var.storage-account_tier
  account_replication_type = var.storage-account_replication_type
}

resource "azurerm_storage_container" "blob-container" {
  name                  = var.blob-container-name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container-access-type
}
