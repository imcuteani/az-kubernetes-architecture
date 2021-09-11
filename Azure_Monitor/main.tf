# Create Azure Resource Group

resource "azurerm_resource_group" "example" {
  name     = var.Resource_group
  location = var.location
  tags     = var.Resource_group_tags

}

resource "azurerm_storage_account" "example" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.azurerm_storage_account_tier
  account_kind             = var.azurerm_storage_account_kind
  account_replication_type = "LRS"
}

# Create Azure Monitor with Azure AD diagnostic settings

resource "azurerm_monitor_aad_diagnostic_setting" "example" {
  name                       = var.azmonitor_diag_setting_name
  storage_account_id         = azurerm_storage_account.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id // Sent monitor diag logs to Azure Log Analytics workspace
  log {
    category = "SignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }

  log {
    category = "AuditLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "NonInteractiveUserSignInLogs"
    enabled  = true
    retention_policy {
      enable = true
      days   = 1
    }
  }
  log {
    category = "ServicePrincipalSignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "ProvisoningLogs"
    enabled  = false
    retention_policy {}
  }
  log {
    category = "ADFSSignInLogs"
    enabled  = false
    retention_policy {}
  }

}

# Azure Log Analytics Workspace ID 

data "azurerm_log_analytics_workspace" "example" {
  name                = azurerm_log_analytics_wsname
  resource_group_name = azurerm_resource_group.example.name
}

terraform {
  backend "remote" {
    organization = "Woodgroove"

    workspaces {
      name = "git-actions-aks-demo"
    }
  }
}