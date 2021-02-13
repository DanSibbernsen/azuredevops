data "azurerm_subscription" "current" {
}

data "azuredevops_project" "main" {
  name = azuredevops_project.main.name
}

data "azurerm_client_config" "current" {
}

resource "azuredevops_serviceendpoint_azurerm" "main" {
  project_id                = azuredevops_project.main.id
  service_endpoint_name     = "Subscription-scoped-ARM"
  description               = "Managed by Terraform"
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
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
