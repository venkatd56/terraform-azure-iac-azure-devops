resource "azurerm_resource_group" "rg" {
  depends_on = [ random_string.myrandom ]
  name     = "${local.resource_name_prefix}-${var.rg_name}-${random_string.myrandom.id}"
  location = var.location
  tags     = local.common_tags
}