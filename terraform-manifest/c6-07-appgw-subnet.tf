# Resource 1: Create AppGateway Subnet
resource "azurerm_subnet" "appgw_subnet" {
  name                  = "${azurerm_virtual_network.vnet.name}-${var.appgw_subnet_name}"
  address_prefixes      = var.appgw_address_space
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  =  azurerm_virtual_network.vnet.name
}

# Resource 2: Create NSG with Rules

locals {
  appgw_inbound_port_maps = {
    "110" : "80"
    "120" : "443"
    "130" : "65200-65535"
  }
}
resource "azurerm_network_security_group" "appgw_nsg" {
  name                  = "${azurerm_subnet.appgw_subnet.name}-nsg"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location

  dynamic security_rule {
    for_each            = local.appgw_inbound_port_maps

    content {
        name                = "allow-${security_rule.value}"
        description         = "APPGW IB rule for ${security_rule.value}"
        priority            = security_rule.key
        direction           = "Inbound"
        access              = "Allow"
        protocol            = "Tcp"
        source_port_range   = "*"
        destination_port_range = security_rule.value
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "appgw-subnet-nsg-associate" {
  //depends_on                = [ azurerm_network_security_group.appgw_nsg ]
  subnet_id                 = azurerm_subnet.appgw_subnet.id
  network_security_group_id = azurerm_network_security_group.appgw_nsg.id
}
