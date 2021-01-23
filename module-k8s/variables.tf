variable "base_tags" {
  type = map
  default = {
    ManagedBy = "terraform"
    Platform  = "kubernetes"
  }
  description = "Base Tags to place on all assets created by module"
}

variable "cluster_name" {
  default = "kubernetes-cluster"
  description = "Name of the AKS Cluster to be created"
  type        = string
}

variable "location" {
  description = "region to which we are deploying this container registry"
  type        = string
}

variable "resource_group" {
  description = "name of the resource group to which this belongs"
  type        = string
}

variable "default_node_pool" {
  description = "Default Node Pool for this AKS cluster"
}
