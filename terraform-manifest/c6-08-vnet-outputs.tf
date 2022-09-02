# Virtual Network Outputs

## Virtual Network Name

output "vnet_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.vnet.name
}

# Virtual Network ID

output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

# Random ID

output "random_id" {
  description = "Random String ID"
  value       = random_string.myrandom.id
}   

# Subnets---------------------------------------------------------

# Web Subnet Outputs------------------------------------

# Web Subnet Name

output "websubnet_name" {
    description = "Web Subnet Name"
    value       = azurerm_subnet.web_subnet.name
}

# Web Subent Id

output "websubnet_id" {
    description = "Web Subnet ID"
    value       = azurerm_subnet.web_subnet.id
}

# Web Subnet NSG Name

output "websubnet_nsg_name" {
    description = "Web Subnet NSG Name"
    value       = azurerm_network_security_group.web_subnet_nsg.name
}

# Websubnet NSG ID

output "websubnet_nsg_id" {
    description = "Web Subnet NSG ID"
    value       = azurerm_network_security_group.web_subnet_nsg.id
}