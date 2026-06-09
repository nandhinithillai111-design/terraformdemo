resource "random_string" "log_suffix" {
  length  = 6
  special = false
  lower   = true
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.aks_subnet_address_prefix]
}

resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "${var.cluster_name}-identity"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "aks_network" {
  scope                = azurerm_subnet.aks_subnet.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
}

resource "azurerm_log_analytics_workspace" "aks" {
  name                = "${var.cluster_name}-logs-${random_string.log_suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "container_insights" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.aks.id
  workspace_name        = azurerm_log_analytics_workspace.aks.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name           = "default"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_identity.id]
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id
  }

  depends_on = [
    azurerm_role_assignment.aks_network,
    azurerm_log_analytics_solution.container_insights,
  ]
}
