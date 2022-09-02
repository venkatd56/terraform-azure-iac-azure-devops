# NIC Configs

resource "azurerm_public_ip" "web_linuxvm_pip" {
  name                = "${local.resource_name_prefix}-web_linumxvm_pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
  domain_name_label   = "app1-vm-${random_string.myrandom.id}" 
}

resource "azurerm_network_interface" "app1_web_linuxvm_nic" {

  //count               = var.web_linuxvm_instance_count
  for_each            = var.app1_web_linuxvm_instance_count
  name                = "${local.resource_name_prefix}-web-linuxvm-nic-${each.key}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                            = "web-linuxvm-app1-ip-1"
    subnet_id                       = azurerm_subnet.web_subnet.id
    private_ip_address_allocation   = "Dynamic"
    public_ip_address_id            = azurerm_public_ip.web_linuxvm_pip.id
  } 

}   