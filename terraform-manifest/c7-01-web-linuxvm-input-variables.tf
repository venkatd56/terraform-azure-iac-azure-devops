# Input variables for Web Linux VM

variable "web_linuxvm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "web_linuxvm_admin_user" {
  type    = string
  default = "azureuser"
}