resource "azuredevops_git_repository" "main" {
  project_id = azuredevops_project.main.id
  name = "${var.repository_name}-imported"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = var.repository_to_import
  }
}

resource "azuredevops_variable_group" "vars" {
  project_id   = azuredevops_project.main.id
  name         = "Infrastructure Pipeline Variables"
  description  = "Managed by Terraform"
  allow_access = true

  variable {
    name  = "FOO"
    value = "BAR"
  }
}

resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.main.id
  name       = "Sample Build Definition"
  path       = "\\ExampleFolder"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.main.id
    branch_name = azuredevops_git_repository.main.default_branch
    yml_path    = "azure-pipelines.yml"
  }

  variable_groups = [
    azuredevops_variable_group.vars.id
  ]

  variable {
    name  = "PipelineVariable"
    value = "Go Microsoft!"
  }

  variable {
    name             = "PipelineSecret"
    secret_value     = "ZGV2cw"
    is_secret        = true
  }
}
