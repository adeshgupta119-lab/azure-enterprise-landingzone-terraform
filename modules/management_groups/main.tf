resource "azurerm_management_group" "root" {
  display_name = var.root_management_group_name
  name         = var.root_management_group_id
}

resource "azurerm_management_group" "platform" {
  display_name               = "Platform"
  name                       = "${var.root_management_group_id}-platform-mg"
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "landing_zones" {
  display_name               = "Landing Zones"
  name                       = "${var.root_management_group_id}-landingzones-mg"
  parent_management_group_id = azurerm_management_group.root.id
}
