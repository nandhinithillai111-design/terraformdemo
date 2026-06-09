data "azurerm_client_config" "current" {}

# GitHub Actions service principal (ARM_CLIENT_ID) is auto-detected via client config.
resource "azurerm_role_assignment" "github_actions_aks_cluster_admin" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "github_actions_aks_cluster_user" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "time_sleep" "wait_for_aks_rbac_propagation" {
  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_role_assignment.github_actions_aks_cluster_admin,
    azurerm_role_assignment.github_actions_aks_cluster_user,
  ]

  create_duration = var.aks_rbac_propagation_wait
}
