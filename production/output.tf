output "name" {
  description = "The name of the Storage Account."
  value = module.storage_account.name
}

output "id" {
  description = "The ID of the Storage Account."
  value = module.storage_account.id
}

output "primary_connection_string" {
  description = "The connection string associated with the primary location."
  value = module.storage_account.primary_connection_string
  sensitive = true
}

output "secondary_connection_string" {
  description = "The connection string associated with the secondary location."
  value = module.storage_account.secondary_connection_string
  sensitive = true
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value = module.storage_account.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  description = "The secondary access key for the storage account."
  value = module.storage_account.secondary_access_key
  sensitive = true
}
