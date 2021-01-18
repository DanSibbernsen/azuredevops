resource "azurerm_container_registry" "main" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"
}
