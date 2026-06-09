output "vm_id" {
  description = "ID of the created virtual machine"
  value       = azurerm_virtual_machine.vmname.id
}

output "vm_name" {
  description = "Name of the created virtual machine"
  value       = azurerm_virtual_machine.vmname.name
}