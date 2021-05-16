output "azurerm_storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "azurerm_monitor_diag_setting_id" {
  value = azurerm_monitor_aad_diagnostic_setting.example.id
}

output "azurerm_log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.example.id
}