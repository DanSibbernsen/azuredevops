variable "name" {
  description = "name of the container. Can only contain alphanumerics"
  type        = string
}

variable "resource_group" {
  description = "name of the resource group to which this belongs"
  type        = string
}

variable "location" {
  description = "region to which we are deploying this container registry"
  type        = string
}
