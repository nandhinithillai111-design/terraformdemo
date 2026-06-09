# AKS managed identity needs Network Contributor on the VNet/subnet.
# GitHub Actions SP requires User Access Administrator on the resource group
# (one-time bootstrap via Azure Portal/CLI) to create these assignments.

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
    azurerm_role_assignment.aks_identity_network_subnet,
    azurerm_role_assignment.aks_identity_network_vnet,
  ]

  create_duration = var.rbac_propagation_wait
}
