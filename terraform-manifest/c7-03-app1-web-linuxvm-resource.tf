locals {
app1_webvm_custom_data = <<CUSTOM_DATA
#!/bin/sh
sudo apt update
sudo apt install apache2 -y
sudo chmod -R 777 /var/www/html 
sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/app1/hostname.html
sudo echo "Welcome to stacksimplify - WebVM App1 - App Status Page" > /var/www/html/app1/status.html
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - WebVM APP-1 </h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html
CUSTOM_DATA
}

resource "azurerm_linux_virtual_machine" "app1_web_linuxvm" {
  name                  = "${local.resource_name_prefix}-web-linuxvm-${each.key}"
  resource_group_name   =  azurerm_resource_group.rg.name
  location              =  azurerm_resource_group.rg.location
  size                  =  var.web_linuxvm_size
  admin_username        = "azureuser"
  //network_interface_ids = [element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)]
  network_interface_ids = [azurerm_network_interface.app1_web_linuxvm_nic[each.key].id]
  admin_ssh_key {
    username            = var.web_linuxvm_admin_user
    public_key          = file("${path.module}/sshkeys/terraform-azure.pub")
  }

  os_disk {
  caching               = "ReadWrite"
  storage_account_type  = "Standard_LRS" 
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18_04-lts-gen2"
    version   = "latest"    
  }
  custom_data = base64encode(local.app1_webvm_custom_data)
}