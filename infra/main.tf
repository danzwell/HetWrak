resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = "st${var.project}${var.environment}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version               = "TLS1_0"
  public_network_access_enabled = true
  allow_nested_items_to_be_public = true
}

resource "azurerm_storage_container" "orders" {
  name                  = "orders"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "blob"
}

resource "random_password" "db" {
  length  = 24
  special = true
}

resource "azurerm_user_assigned_identity" "pipeline" {
  name                = "id-${var.project}-pipeline"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}

data "azurerm_subscription" "current" {}

resource "azurerm_role_assignment" "pipeline" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.pipeline.principal_id
}
