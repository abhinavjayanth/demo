resource "azurerm_sql_server" "example" {
  name                         = var.sql_server-name
  resource_group_name          = var.name
  location                     = var.location
  version                      = var.sql_server-version
  administrator_login          = var.sql_server-administrator_login
  administrator_login_password = var.sql_server-administrator_login_password
}

resource "azurerm_sql_database" "example" {
  name                = var.sql_database-name
  resource_group_name = var.name
  location            = var.location
  server_name         = azurerm_sql_server.example.name
}
