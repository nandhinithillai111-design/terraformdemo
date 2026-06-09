output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.nanrg.name
}

output "resource_group_id" {
  description = "ID of the created resource group"
  value       = azurerm_resource_group.nanrg.id
}