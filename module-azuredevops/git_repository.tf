resource "azuredevops_git_repository" "main" {
  project_id = azuredevops_project.main.id
  name = "${var.repository_name}-clean"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "main2" {
  project_id = azuredevops_project.main.id
  name = "${var.repository_name}-imported"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = var.repository_to_import
  }
}
