resource "azuredevops_project" "project" {
  name        = var.name
  description = "All the fun of terraform, none of the Azure mess!"
}
