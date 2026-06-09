data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_role_assignment" "deployer_contributor" {
  scope                = data.azurerm_resource_group.this.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "deployer_user_access_administrator" {
  scope                = data.azurerm_resource_group.this.id
  role_definition_name = "User Access Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "deployer_network_contributor_vnet" {
  scope                = var.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "deployer_aks_contributor" {
  scope                = data.azurerm_resource_group.this.id
  role_definition_name = "Azure Kubernetes Service Contributor Role"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "aks_identity_network_subnet" {
  scope                = azurerm_subnet.aks_subnet.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
}

resource "azurerm_role_assignment" "aks_identity_network_vnet" {
  scope                = var.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
}

resource "time_sleep" "wait_for_rbac_propagation" {
  depends_on = [
    azurerm_role_assignment.deployer_contributor,
    azurerm_role_assignment.deployer_user_access_administrator,
    azurerm_role_assignment.deployer_network_contributor_vnet,
    azurerm_role_assignment.deployer_aks_contributor,
    azurerm_role_assignment.aks_identity_network_subnet,
    azurerm_role_assignment.aks_identity_network_vnet,
  ]

  create_duration = var.rbac_propagation_wait
}
