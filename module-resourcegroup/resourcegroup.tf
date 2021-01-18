resource "azurerm_resource_group" "test" {
  name = var.name
  location = var.location
  tags = merge(var.base_tags, {
    Environment = terraform.workspace
    Role        = "resourcegroup"
  })
}
