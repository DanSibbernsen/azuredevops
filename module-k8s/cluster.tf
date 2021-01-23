resource "azurerm_kubernetes_cluster" "k8s" {
  name = var.cluster_name
  dns_prefix = var.cluster_name
  location = var.location
  resource_group_name = var.resource_group

  addon_profile {
    http_application_routing {
      enabled = false
    }
  }

  default_node_pool {
    name = lookup(var.default_node_pool, "name", "default")
    vm_size = lookup(var.default_node_pool, "vm_size", "Standard_D2_V3")
    availability_zones = lookup(var.default_node_pool, "availability_zones", [1,2,3])
    enable_auto_scaling = lookup(var.default_node_pool, "enable_auto_scaling", false)
    enable_node_public_ip = lookup(var.default_node_pool, "enable_node_public_ip", false)
    node_count = lookup(var.default_node_pool, "node_count", 2)
    os_disk_size_gb = lookup(var.default_node_pool, "os_disk_size_gb", "50")

    tags = merge(var.base_tags, {
      Environment = terraform.workspace
      Role = "node-pool"
      })
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  tags = merge(var.base_tags, {
    Environment = terraform.workspace
    })
}
