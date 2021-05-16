variable "subscription_id" {
  type        = string
  description = "The Subscription Id for Azure account"
}

variable "client_id" {
  type        = string
  description = "The Client Id of the service principal"
}

variable "client_secret" {
  type        = string
  description = "The client secret of the service pricipal"
}

variable "tenant_id" {
  type        = string
  description = "the tenant Id of the directory"
}

variable "Resource_group" {
  type        = string
  description = "The resource group of Azure Kubernetes resource"
}

variable "location" {
  type        = string
  description = "The location of the resource group"
}

variable "Resource_group_tags" {
  type        = map(string)
  default     = { OWNER = "Anindita Basak", Origin = "az-database", ReasonCreated = "certification" }
  description = "The Azure Resource group tags"
}
variable "azurerm_storage_account_name" {
  type        = string
  description = "The Azure storage account underlying to Azure monitor"
}
variable "azurerm_storage_account_tier" {
  type        = string
  description = "The Storage account tier"
}
variable "azurerm_storage_account_kind" {
  type        = string
  description = "The Azure storage account kind"

}
variable "azmonitor_diag_setting_name" {
  type        = string
  description = "The Azure monitor diagnostic settings name"

}
variable "azurerm_log_analytics_wsname" {
  type        = string
  description = "The log analytics workspace name connected to azure monitor"
}
