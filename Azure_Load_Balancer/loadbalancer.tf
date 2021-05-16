# Create Azure Resource Group

resource "azurerm_resource_group" "example" {
    name  = "${var.Resource_group}"
    location = "${var.location}"
    tags     = "${var.Resource_group_tags}"
  
}

# Create Azure Public IP 

resource "azurerm_public_ip" "example" {
    name = "${var.azure_public_ip_name}"
    location = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    allocation_method = "Static"
  
}

# Create Azure Load Balancer 

resource "azurerm_lb" "example" {
 name = "${azurerm_lb_name}"
 location = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name
 frontend_ip_configuration {
   name = "${azurerm_frontend_ip_name}"
   public_ip_address_id = azurerm_public_ip_example.id
 }
 sku = "Standard"
}