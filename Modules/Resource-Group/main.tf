provider "azurerm" {
    features {}
    skip_provider_registration = true

}


# Create a resource group
resource "azurerm_resource_group" "nanrg" {
  name     = "var.resource_group_name"
  location = "var.location"
}
