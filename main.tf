 terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.42.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
           client_id = "db41879d-b09f-452c-b22b-85130d37398a"
           client_secret = "KV.8Q~xK1mmrfY3N2lUIMZXa4CRe6PQr6yHu4caQ"
           tenant_id = "750f2040-ab7f-42ed-8001-36ba05e30750"
           subscription_id = "a1085f45-3c41-4277-b3a7-cd100aaffb99"
  }
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
