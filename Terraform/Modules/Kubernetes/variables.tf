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

variable "vnet_id" {
  description = "ID of the virtual network"
  type        = string
}

variable "rbac_propagation_wait" {
  description = "Duration to wait for RBAC role assignments to propagate before creating AKS"
  type        = string
  default     = "5m"
}

variable "aks_rbac_propagation_wait" {
  description = "Duration to wait after AKS is created and CI/CD SPN is granted cluster access"
  type        = string
  default     = "5m"
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

variable "service_cidr" {
  description = "Kubernetes service CIDR — must not overlap with VNet or subnet ranges"
  type        = string
  default     = "10.1.0.0/16"
}

variable "dns_service_ip" {
  description = "Kubernetes DNS service IP — must be within service_cidr"
  type        = string
  default     = "10.1.0.10"
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
