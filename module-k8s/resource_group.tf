resource "azurerm_resource_group" "k8s" {
  name = var.resource_group
  location = var.location
  tags = merge(var.base_tags, {
    Environment = terraform.workspace
    Role        = "resourcegroup"
  })
}
