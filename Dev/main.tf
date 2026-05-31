provider "azurerm" {
  features { 
  }
skip_provider_registration = true
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
    subnet_id           = azurerm_subnet.subnet.id

    }

module "vmname" {
    source              = "../Modules/Virtualmachine"
    depends_on          = [module.vnet]
    vmname_name         = var.vmname
    resource_group_name = var.resource_group_name
    location            = var.location
    nic_id              = azurerm_network_interface.nic.id
}
