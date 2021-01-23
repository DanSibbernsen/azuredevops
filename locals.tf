locals {
  env = terraform.workspace

  default_node_pool_list = {
    default = {
      name                  = "default"
      vm_size               = "Standard_D2_v3"
      availability_zones    = [1, 2, 3]
      enable_auto_scaling   = false
      enable_node_public_ip = false
      node_count            = 2
      os_disk_size_gb       = 50
      max_pods              = 30
    }
    dev = {
      name                  = "default"
      vm_size               = "Standard_D2_v3"
      availability_zones    = [1, 2, 3]
      enable_auto_scaling   = false
      enable_node_public_ip = false
      node_count            = 2
      os_disk_size_gb       = 50
      max_pods              = 30
    }

  }


  virtual_network_address_prefix_list = {
    default = "15.0.0.0/8"
    dev     = "15.0.0.0/8"
  }

  aks_subnet_address_prefix_list = {
    default = "15.0.0.0/16"
    dev     = "15.0.0.0/16"
  }

  app_gateway_subnet_address_prefix_list = {
    default = "15.1.0.0/16"
    dev     = "15.1.0.0/16"
  }

  region_list = {
    default = "Central US"
    dev     = "Central US"
  }

  resource_group_list = {
    default = "test"
    dev     = "test"
  }

  cluster_name                      = "threeTierSample-aks-${local.env}"
  default_node_pool                 = lookup(local.default_node_pool_list, local.env)
  virtual_network_address_prefix    = lookup(local.virtual_network_address_prefix_list, local.env)
  aks_subnet_address_prefix         = lookup(local.aks_subnet_address_prefix_list, local.env)
  app_gateway_subnet_address_prefix = lookup(local.app_gateway_subnet_address_prefix_list, local.env)
  location                          = lookup(local.region_list, local.env)
  resource_group                    = lookup(local.resource_group_list, local.env)
  registry_name                     = "threeTierSampleACR"
}
