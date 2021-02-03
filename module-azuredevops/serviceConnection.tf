data "azurerm_subscription" "current" {
}

data "azuredevops_project" "main" {
  name = azuredevops_project.main.name
}

resource "azuredevops_serviceendpoint_azurerm" "main" {
  project_id                = azuredevops_project.main.id
  service_endpoint_name     = "ARMFor${var.project_name}"
  description = "Managed by Terraform"
  azurerm_spn_tenantid      = data.azurerm_subscription.current.tenant_id
  azurerm_subscription_id   = data.azurerm_subscription.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
  resource_group            = azurerm_resource_group.main.name
}

resource "time_sleep" "wait_30_seconds_armconnection" {
  depends_on = [azuredevops_serviceendpoint_azurerm.main]
  create_duration = "30s"
}

resource "azuredevops_resource_authorization" "main" {
  depends_on = [time_sleep.wait_30_seconds_armconnection]
  project_id = data.azuredevops_project.main.id
  resource_id = azuredevops_serviceendpoint_azurerm.main.id
  authorized = true
}
