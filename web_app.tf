resource "azurerm_resource_group" "montreal" {
  name     = "mcit-resources"
  location = "West Europe"
}

resource "azurerm_service_plan" "mcit1" {
  name                = "mcit"
  resource_group_name = azurerm_resource_group.mcit.name
  location            = azurerm_resource_group.mcit.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "mcit" {
  name                = "mcit"
  resource_group_name = azurerm_resource_group.mcit.name
  location            = azurerm_service_plan.mcit.location
  service_plan_id     = azurerm_service_plan.mcit.id

  site_config {}
}
