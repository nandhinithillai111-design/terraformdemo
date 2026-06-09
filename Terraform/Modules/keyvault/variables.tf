variable "kv_name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region where the Key Vault will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the Key Vault will be created"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID for Key Vault access policies"
  type        = string
  default     = null
}

variable "object_id" {
  description = "Azure Active Directory object ID for Key Vault access policies"
  type        = string
  default     = null
}
