provider "azurerm" {
    features {}
    resource_provider_registrations = "core"
}


# Create a resource group
resource "azurerm_resource_group" "nanrg" {
  name     = var.resource_group_name
  location = var.location
}
