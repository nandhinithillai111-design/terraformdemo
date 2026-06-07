variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
  default     = "int-resourcegroup"
}

variable "location" {
  description = "name of the location"
  type        = string
  default     = "centralindia"
}

variable "vnet_name" {
  description = "name of the vnet"
  type        = string
  default     = "int-vnet"
}

variable "subnet_name" {
  description = "name of the subnet"
  type        = string
  default     = "int-subnet"
}

variable "nic_name" {
  description = "name of the nic"
  type        = string
  default     = "int-nic"
}
