variable "name" {
  type = string
  description = "name of the resource group."
}

variable "location" {
  type = string
  description = "location of the resource group."  
}

variable  "vnet-name" {
  type = string
  description = "name of the virtual network." 
}

variable  "vnet-address-space"  {
  type = list(string)
  description = " address space of the virtual network."
}

variable  "vnet-subnet-name"  {
  type = string
  description = "name of the subnet."
}

variable  "vnet-subnet-address-prefix"  {
  type = string
  description = "address space of the subnet."
}

variable  "storage-name"  {
  type = string
  description = "name of the storage account"
}

variable  "storage-account_tier"  {
  type = string
  description = "type of the storage account tier"
}

variable  "storage-account_replication_type"  {
  type = string
  description = "storage account replication type"
}

variable "blob-container-name" {
  type = string
  description ="name of the blob"
}

variable "container-access-type" {
  type = string
  description = "access type of container"
}

variable "sql_server-name" {
  type = string
  description = "name of the sql server"
}

variable "sql_server-version" {
  type = string
  description = "version of the sql server"
}

variable "sql_server-administrator_login" {
  type = string
  description = "name of the sql server admin"
}

variable "sql_server-administrator_login_password" {
  type = string
  description = "password  of the sql server admin"
}

variable "sql_database-name" {
  type = string
  description = "name of the sql database"
}

variable "loganalyticsws-name" {
  type = string
  description = "name of the log analytics workspace"
}

variable "datafactory-name" {
  type = string
  description = "name of the datafactory"
}  




