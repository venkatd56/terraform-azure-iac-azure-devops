## Public IP Address
output "web_linuxvm_publicip" {
  value = azurerm_public_ip.web_linuxvm_pip.ip_address
}

## Network Interface ID
output "web_linux_vm_id" {
  value = azurerm_network_interface.app1_web_linuxvm_nic.id
}

## Network Interface Private IP Addresses
output "web_linuxvm_private_ip" {
  value = [azurerm_network_interface.app1_web_linuxvm_nic.private_ip_addresses]
}

## Virtual Machine ID
output "web_linuxvm_machine_id" {
  value = azurerm_linux_virtual_machine.app1_web_linuxvm.id
}