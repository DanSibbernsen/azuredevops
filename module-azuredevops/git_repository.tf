resource "azuredevops_git_repository" "main" {
  project_id = azuredevops_project.main.id
  name = var.repository_name
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository" "main2" {
  project_id = azuredevops_project.main.id
  name = "${var.repository_name}2"
  initialization {
    init_type = "Clean"
  }
}
