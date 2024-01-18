resource "azurerm_data_factory" "datafactory" {
  name                = var.datafactory-name
  location            = var.location
  resource_group_name = var.name
}