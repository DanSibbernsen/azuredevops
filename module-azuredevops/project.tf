resource "azuredevops_project" "main" {
  name                = var.project_name
  description         = "All the fun of terraform, none of the Azure mess!"
  visibility          = "private"
  version_control     = "git"
  work_item_template  = "Agile"
}
