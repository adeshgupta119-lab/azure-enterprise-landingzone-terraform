variable "resource_group_name" {
  description = "Name of the Spoke resource group"
  type        = string
}

variable "location" {
  description = "Deployment region"
  type        = string
}

variable "spoke_vnet_name" {
  description = "Spoke Virtual network name"
  type        = string
}

variable "hub_vnet_id" {
  description = "Resource ID of the Hub VNet"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the Hub VNet"
  type        = string
}

variable "hub_resource_group_name" {
  description = "Resource Group name of the Hub"
  type        = string
}

variable "hub_route_table_id" {
  description = "Resource ID of the Hub Route Table"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

