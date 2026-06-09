output "cluster_id" {
  description = "ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "cluster_fqdn" {
  description = "FQDN of the AKS cluster API server"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "kube_config" {
  description = "Raw kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "aks_subnet_id" {
  description = "ID of the AKS node subnet"
  value       = azurerm_subnet.aks_subnet.id
}

output "managed_identity_id" {
  description = "ID of the user-assigned managed identity for AKS"
  value       = azurerm_user_assigned_identity.aks_identity.id
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.aks.id
}

output "cicd_principal_id" {
  description = "Object ID of the GitHub Actions service principal granted AKS cluster access"
  value       = data.azurerm_client_config.current.object_id
}

output "helm_deploy_ready" {
  description = "Indicates AKS cluster access has propagated and the Helm pipeline can run"
  value       = true
  depends_on  = [time_sleep.wait_for_aks_rbac_propagation]
}
