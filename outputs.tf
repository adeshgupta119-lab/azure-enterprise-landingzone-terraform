output "hub_vnet_id" {
  description = "Hub Virtual Network identifier"
  value       = module.hub_network.hub_vnet_id
}

output "firewall_ip" {
  description = "Azure Firewall private IP address"
  value       = module.hub_network.firewall_private_ip
}
