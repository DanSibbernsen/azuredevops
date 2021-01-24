variable "base_tags" {
  type = map
  default = {
    ManagedBy = "terraform"
    Platform  = "azuredevops"
  }
  description = "Base Tags to place on all assets created by module"
}

variable "project_name" {
  default     = "azure"
  type        = string
  description = "Name of the azure devops project"
}

variable "repository_name" {
  default     = "testRepo"
  type        = string
  description = "name of code repository"
}

variable "repository_to_import" {
  type = string
  description = "Repository to import, so a link to a site like github"
}
