output "azurerm_container_registry_id" {
  value = azurerm_container_registry.acr.id
}

output "azurerm_user_assigned_identity_id"{
    value = azurerm_user_assigned_identity.example.id
}

output "azurem_key_vault_id" {
    value = azurerm_key_vault.example.id
}