resource "random_id" "acr" {
  byte_length = 8
}

resource "azurerm_container_registry" "k8s" {
  name                = "${var.resource_group}k8s${random_id.acr.hex}"
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

provider "kubernetes" {
  load_config_file = "false"
  host = azurerm_kubernetes_cluster.k8s.kube_config.0.host
  username = azurerm_kubernetes_cluster.k8s.kube_config.0.username
  password = azurerm_kubernetes_cluster.k8s.kube_config.0.password
  client_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
  client_key = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
}

resource "kubernetes_secret" "dockerconfig" {
  metadata {
    name = "docker-cfg"
  }

data = {
    ".dockerconfigjson" = <<DOCKER
  {
  "auths": {
    "${azurerm_container_registry.k8s.login_server}": {
      "auth": "${base64encode("${azurerm_container_registry.k8s.admin_username}:${azurerm_container_registry.k8s.admin_password}")}"
    }
  }
  }
  DOCKER
  }
    type = "kubernetes.io/dockerconfigjson"

}
