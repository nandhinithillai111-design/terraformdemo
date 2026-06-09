variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the AKS node subnet"
  type        = string
}

variable "aks_subnet_address_prefix" {
  description = "Address prefix for the AKS node subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for the default node pool"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the AKS cluster"
  type        = string
  default     = null
}
