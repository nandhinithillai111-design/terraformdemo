provider "azurerm" {
  features {}
  resource_provider_registrations = "core"
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.74.0"
    }
 }
  required_version = ">= 1.4.6"
  backend "azurerm" {
    resource_group_name  = "statefileresourcegroup"
    storage_account_name = "stfileaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     =  true
    tenant_id            = "e68dc8e6-282b-47fa-9d81-aaef661d0ecb"
  } 
}
module "nanrg" { 
    source              = "../Modules/Resource-Group"
    resource_group_name = var.resource_group_name
    location            = var.location
    
}
module "vnet"{
    source              = "../Modules/Vnet"
    depends_on          = [module.nanrg]
    vnet_name           = var.vnet_name
    resource_group_name = var.resource_group_name
    location            = var.location
    subnet_name         = var.subnet_name
    nic_name            = var.nic_name
}

module "vmname" {
    source              = "../Modules/Virtualmachine"
    depends_on          = [module.vnet]
    vmname_name         = var.vmname
    resource_group_name = var.resource_group_name
    location            = var.location
    nic_id              = [module.vnet.nic_id]
}
