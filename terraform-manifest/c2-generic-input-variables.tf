# Business Division

variable "business_division" {
  type = string
  default = "SAP"
}

# Environment Variable

variable "environment" {
  type = string
  default = "dev"
}

# Azure Resource Group Name 
variable "rg_name" {
  type = string
  default = "rg-default"
}

# Azure Resources Location

variable "location" {
  type = string
  default = "eastus2"
}