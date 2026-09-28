output "blob_endpoint" {
  description = "Waar de orderservice zijn blobs neerzet."
  value       = azurerm_storage_account.main.primary_blob_endpoint_url
}

output "db_password" {
  description = "Wachtwoord voor de orderdatabase."
  value       = random_password.db.result
}

output "resource_group" {
  value = azurerm_resource_group.main.name
}
