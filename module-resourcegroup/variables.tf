variable "name" {
  description = "Name of the resource group"
  type = string
}

variable "location" {
  description = "region to which we are deploying this resource group"
  type = string
}

variable "base_tags" {
  type = map
  default = {
    ManagedBy = "terraform"
    Platform  = "azuredevops"
  }
  description = "Base Tags to place on all assets created by module"
}
