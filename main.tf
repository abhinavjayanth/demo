 terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source = "./RG"
  name = var.name
  location = var.location
}

module "virtualnetwork" {
    source = "./VNET"
    vnet-name  = var.vnet-name
    location = module.resourcegroup.location
    name = module.resourcegroup.name
    vnet-address-space  = var.vnet-address-space
    vnet-subnet-name= var.vnet-subnet-name
    vnet-subnet-address-prefix = var.vnet-subnet-address-prefix
}

module "storage" {
  source ="./STORAGE"
  name = module.resourcegroup.name
  location = module.resourcegroup.location
  storage-name = var.storage-name
  storage-account_tier = var.storage-account_tier
  storage-account_replication_type = var.storage-account_replication_type
  blob-container-name = var.blob-container-name
  container-access-type = var.container-access-type
}

module "database" {
  source = "./SQL"
  name = module.resourcegroup.name
  location = module.resourcegroup.location
  sql_server-name = var.sql_server-name
  sql_server-version = var.sql_server-version
  sql_server-administrator_login = var.sql_server-administrator_login
  sql_server-administrator_login_password = var.sql_server-administrator_login_password
  sql_database-name = var.sql_database-name
}

module "loganalyticsws" {
source = "./LOGANALYTICSWORKSPACE"
loganalyticsws-name = var.loganalyticsws-name
name = module.resourcegroup.name
location = module.resourcegroup.location
}

module "datafactory" {
  source = "./DATAFACTORY"
  datafactory-name = var.datafactory-name  
  name = module.resourcegroup.name
  location = module.resourcegroup.location
}