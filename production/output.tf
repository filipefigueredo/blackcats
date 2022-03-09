output "storage_account_name" {
  description = "The name of the Storage Account."
  value = module.storage_account.name
}

output "storage_account_id" {
  description = "The ID of the Storage Account."
  value = module.storage_account.id
}

output "storage_account_primary_connection_string" {
  description = "The connection string associated with the primary location."
  value = module.storage_account.primary_connection_string
  sensitive = true
}

output "storage_account_secondary_connection_string" {
  description = "The connection string associated with the secondary location."
  value = module.storage_account.secondary_connection_string
  sensitive = true
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account."
  value = module.storage_account.primary_access_key
  sensitive = true
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key for the storage account."
  value = module.storage_account.secondary_access_key
  sensitive = true
}
