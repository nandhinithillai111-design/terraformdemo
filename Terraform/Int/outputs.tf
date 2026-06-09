output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.nanrg.resource_group_name
}

output "resource_group_id" {
  description = "ID of the created resource group"
  value       = module.nanrg.resource_group_id
}

output "vnet_id" {
  description = "ID of the created virtual network"
  value       = module.vnet.vnet_id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = module.vnet.subnet_id
}

output "nic_id" {
  description = "ID of the created network interface"
  value       = module.vnet.nic_id
}

output "vm_id" {
  description = "IDs of the created virtual machines"
  value       = module.vm[*].vm_id
}

output "vm_name" {
  description = "Names of the created virtual machines"
  value       = module.vm[*].vm_name
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster"
  value       = module.kubernetes.cluster_id
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = module.kubernetes.cluster_name
}

output "aks_cluster_fqdn" {
  description = "FQDN of the AKS cluster API server"
  value       = module.kubernetes.cluster_fqdn
}

output "aks_subnet_id" {
  description = "ID of the AKS node subnet"
  value       = module.kubernetes.aks_subnet_id
}

output "aks_log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace for AKS"
  value       = module.kubernetes.log_analytics_workspace_id
}
