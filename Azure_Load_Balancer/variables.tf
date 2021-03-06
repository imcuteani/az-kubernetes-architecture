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
variable "azure_public_ip_name" {
  type = string
  description = "The Azure Public IP address"
}

variable "azurerm_lb_name" {
  type = string
  description = "The Azure Load balancer name"
}

variable "azurerm_frontend_ip_name" {
  type = string
  description = "The Azure Load balancer front-end IP address name"
}