locals {
  env = terraform.workspace

  region_list = {
    default = "Central US"
    dev     = "Central US"
  }

  resource_group_list = {
    default = "test"
    dev     = "test"
  }

  location                          = lookup(local.region_list, local.env)
  resource_group                    = lookup(local.resource_group_list, local.env)
}
