resource "azurerm_virtual_network" "example" {
  name                =var.vnet-name
  location            =var.location
  resource_group_name =var.name
  address_space       =var.vnet-address-space

  subnet {
    name          = var.vnet-subnet-name
    address_prefix = var.vnet-subnet-address-prefix
  }
}
