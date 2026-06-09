variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
  default     = "prod-resourcegroup"
}

variable "location" {
  description = "name of the location"
  type        = string
  default     = "centralindia"
}

variable "vnet_name" {
  description = "name of the vnet"
  type        = string
  default     = "prod-vnet"
}

variable "subnet_name" {
  description = "name of the subnet"
  type        = string
  default     = "prod-subnet"
}

variable "nic_name" {
  description = "name of the nic"
  type        = string
  default     = "prod-nic"
}
