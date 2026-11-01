variable "location" {
  description = "Target deployment region"
  type        = string
  default     = "eastus2"
}

variable "environment" {
  description = "Environment identifier (e.g. prod, uat, dev)"
  type        = string
  default     = "prod"
}

variable "root_management_group_id" {
  description = "Root Management Group identifier"
  type        = string
  default     = "ent-corp"
}

variable "root_management_group_name" {
  description = "Root Management Group display name"
  type        = string
  default     = "Enterprise Root"
}

variable "common_tags" {
  description = "Enterprise tags"
  type        = map(string)
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Framework   = "Azure-CAF"
  }
}

