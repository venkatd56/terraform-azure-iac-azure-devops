## Virtual Network
variable "vnet_name" {
    type = string
    default = "vnet-default"
    description = "Virtual Network Name"
  
}
## Vnet Address Space

variable "vnet_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Virtual Network Address Space"
}

## # Web Subnet Name

variable "web_subnet_name" {
    type = string
    default = "web-subnet"
    description = "Websubnet Name"
}

# Web Subnet Address Space
variable "websubnet_address_space" {
  type = list(string)
  default = ["10.0.1.0/24"]
  description = "Web Subnet Address Space"
}

# App Subnet Name

variable "app_subnet_name" {
    type = string
    default = "app-subnet"
    description = "Appsubnet Name"
}

# App Subnet Address Space
variable "appsubnet_address_space" {
  type = list(string)
  default = [ "10.0.2.0/24" ]
  description = "App Subnet Address Space"
}

# Database Subnet Name

variable "db_subnet_name" {
    type = string
    default = "db-subnet"
    description = "DBsubnet Name"
}

# Database Subnet Address Space

variable "dbsubnet_address_space" {
  type = list(string)
  default = [ "10.0.3.0/24" ]
  description = "DB Subnet Address Space"
}

# Bastion / Management Subnet Name

variable "bastion_subnet_name" {
    type = string
    default = "Bastion-subnet"
    description = "Bastionsubnet Name"
}

# Bastion / Management Subnet Address Space

variable "bastionsubnet_address_space" {
  type        = list(string)
  default     = [ "10.0.4.0/24" ]
  description = "Bastion Subnet Address Space"
}

# Application Gateway Subnet

variable "appgw_subnet_name" {
  type        = string
  default     = "appgw-subnet"
  description = "Application Gateway Subnet"

}

variable "appgw_address_space" {
  type        = list(string)
  default     = [ "10.0.5.0/24" ]
  description = "Application Gateway Address Space"
}