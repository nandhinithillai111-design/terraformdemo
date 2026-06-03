variable "resource_group_name" {
  description = "name of the resource group"
  type        =  string
  default     = "myresourcegroup"
}
variable "vmname" {
  description = "name of the vm"
  type        =  string
  default     = "myvm"
}
variable "location" {
  description = "name of the location"
  type        =  string
  default     = "centralindia"
}
variable "vnet_name" {
  description = "name of the vnet"
  type        =  string
  default     = "myvnet"
}
variable "subnet_name" {
  description = "name of the subnet"
  type        =  string
  default     = "mysubnet"
}
variable "nic_name" {
  description = "name of the nic"
  type        =  string
  default     = "mynic"
}



