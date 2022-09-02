

locals {
  environment           = var.environment
  division              = var.business_division
  resource_name_prefix  = "${var.business_division}-${var.environment}"
  //name = "${local.division}-${local.environment}"
  common_tags = {
    environment = local.environment
    division    = local.division
  }
}