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

variable "aks_cluster_name" {
  description = "name of the AKS cluster"
  type        = string
  default     = "int-aks"
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
  default     = "intaks"
}

variable "aks_subnet_name" {
  description = "name of the AKS node subnet"
  type        = string
  default     = "int-aks-subnet"
}

variable "aks_node_count" {
  description = "number of nodes in the AKS default node pool"
  type        = number
  default     = 1
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2s_v3"
}
