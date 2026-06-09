provider "azurerm" {
  features {}
  resource_provider_registrations = "extended"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.74.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }
  required_version = ">= 1.4.6"
  backend "azurerm" {
    resource_group_name  = "statefileresourcegroup"
    storage_account_name = "stfileaccount"
    container_name       = "tfstate"
    key                  = "int.terraform.tfstate"
    use_azuread_auth     = true
    tenant_id            = "e68dc8e6-282b-47fa-9d81-aaef661d0ecb"
  }
}

resource "random_string" "kv_suffix" {
  length  = 8
  special = false
  lower   = true
}

module "nanrg" {
  source              = "../Modules/Resource-Group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet" {
  source              = "../Modules/Vnet"
  depends_on          = [module.nanrg]
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_name         = var.subnet_name
  nic_name            = var.nic_name
}

resource "azurerm_network_interface" "vm_nic" {
  count               = 1
  name                = "vm-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

module "vm" {
  source              = "../Modules/Virtualmachine"
  count               = 1
  depends_on          = [module.vnet]
  vmname_name         = "vm-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  nic_id              = azurerm_network_interface.vm_nic[count.index].id
}

module "kv" {
  source     = "../Modules/keyvault"
  depends_on = [module.nanrg]

  for_each = {
    "kv1" = "kv1${random_string.kv_suffix.result}"
    "kv2" = "kv2${random_string.kv_suffix.result}"
  }
  kv_name             = each.value
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "kubernetes" {
  source              = "../Modules/Kubernetes"
  depends_on          = [module.vnet]
  cluster_name        = var.aks_cluster_name
  dns_prefix          = var.aks_dns_prefix
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  vnet_id             = module.vnet.vnet_id
  aks_subnet_name     = var.aks_subnet_name
  node_count          = var.aks_node_count
  vm_size             = var.aks_vm_size
}
