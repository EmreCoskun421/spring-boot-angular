locals {
  ressource_name= "emre-terraform"
  location= "West Europe"
  registry_name= "registryEmreTechstarter"
}
resource "azurerm_resource_group" "ressource_group" {
  name     = local.ressource_name
  location = local.location
}

resource "azurerm_container_registry" "acr" {
  name                =  local.registry_name
  resource_group_name =  local.ressource_name
  location            =  local.location
  sku                 = "Basic"
  admin_enabled       = true
}