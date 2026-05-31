output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "nic_id" {
  value = azurerm_network_interface.nic.id
}