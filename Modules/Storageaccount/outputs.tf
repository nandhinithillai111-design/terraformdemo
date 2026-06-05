output "storage_name" {
  description = "name of the storage account"
  value       =  azurerm_storage_account.storage.name
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = azurerm_subnet.subnet.id
}
