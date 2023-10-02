resource "azurerm_resource_group" "lagos" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_service_plan" "mcit" {
  name                = "mcit-plan"
  resource_group_name = azurerm_resource_group.mcit.name
  location            = azurerm_resource_group.mcit.location
  os_type             = "Windows"
  sku_name            = "P1v2"
}

resource "azurerm_windows_web_app" "mcit2" {
  name                = "mcit-windows-web-app"
  resource_group_name = azurerm_resource_group.mcit.name
  location            = azurerm_service_plan.mcit.location
  service_plan_id     = azurerm_service_plan.mcit.id

  site_config {}
}

resource "azurerm_windows_web_app_slot" "mcit3" {
  name           = "mcit-slot"
  app_service_id = azurerm_windows_web_app.mcit.id

  site_config {}
}
