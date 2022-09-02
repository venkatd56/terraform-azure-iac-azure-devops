# Web Subnet 

resource "azurerm_subnet" "web_subnet" {
  name                  = "${azurerm_virtual_network.vnet.name}-${var.web_subnet_name}"
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = var.websubnet_address_space

}

# Web NSG

resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                  = "${azurerm_subnet.web_subnet.name}-nsg"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
}

# NSG Rules

locals {
  web_inbound_port_map = {
    "210":"80"  # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "220":"443"
    "230":"22"
  }
}

resource "azurerm_network_security_rule" "web_nsg_rule_inbound" {
  for_each = local.web_inbound_port_map
  name                        = "rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}

## Assosiate Subnet and NSG

resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_associate" {

 depends_on = [ azurerm_network_security_rule.web_nsg_rule_inbound ]
 subnet_id                 = azurerm_subnet.web_subnet.id
 network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id

}