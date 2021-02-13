resource "azurerm_resource_group" "main" {
  name = var.project_name
  location = var.location
  tags = {
    Environment = terraform.workspace
    Role        = "resourcegroup"
  }
}

resource "azurerm_storage_account" "main" {
  name                     = var.project_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    Environment = terraform.workspace
    environment = "resourcegroup"
  }
}

resource "azurerm_storage_container" "main" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}
