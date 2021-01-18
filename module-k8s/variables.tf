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
