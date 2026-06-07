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
