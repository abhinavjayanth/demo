resource "azurerm_log_analytics_workspace" "loganalyticsws" {
  name                = var.loganalyticsws-name
  location            = var.location
  resource_group_name = var.name
}
  