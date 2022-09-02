environment             = "stage"

vnet_name               = "vnet01"
vnet_address_space      = ["10.3.0.0/16"]

web_subnet_name         = "websubnet"
websubnet_address_space = ["10.3.1.0/24"]

app_subnet_name         = "appsubnet"
appsubnet_address_space = ["10.3.2.0/24"]

db_subnet_name          = "dbsubnet"
dbsubnet_address_space  = ["10.3.3.0/24"]

bastion_subnet_name         = "bastionsubnet"
bastionsubnet_address_space = ["10.3.4.0/24"]

web_linuxvm_size        = "Standard_B1s"
web_linuxvm_admin_user  = "azureuser"



