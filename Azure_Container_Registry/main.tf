# Create Azure Resource Group

resource "azurerm_resource_group" "example" {
    name  = "${var.Resource_group}"
    location = "${var.location}"
    tags     = "${var.Resource_group_tags}"
  
}

# Create ACR registry 

resource "azurerm_container_registry" "acr" {
  name  = "${var.acr_name}"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  sku = "Premium"

  identity{ 
      type = "UserAssigned"
      identity_ids = [ 
          azurerm_user_assigned_identity_example.id
      ]
  }

  encryption {
      enabled = true
      key_vault_key_id = data.azurerm_key_vault_key.example.id
      identity_client_id = azurerm_user_assigned_identity_example.example.client_id
  }
}

# Azure user assigned identity
 
resource "azurerm_user_assigned_identity" "example" {
    resource_group_name = azurerm_resource_group.example.name 
    location = azurerm_resource_group.example.location
    name = "${var.azurerm_user_identity_name}"
}

data "azurerm_key_vault" "example" {
  name  = "${var.azurerm_kv_name}"
  key_vault_id = data.azurerm_key_vault.existing.id
}

terraform {
  backend "remote" {
    organization = "Woodgroove"

    workspaces {
      name = "git-actions-aks-demo"
    }
  }
}