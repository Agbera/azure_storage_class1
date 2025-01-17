resource "azurerm_resource_group" "montrealcollege" {
  name     = "mcit-resources"
  location = "West Europe"
}

resource "azurerm_service_plan" "example" {
  name                = "mcit-plan"
  resource_group_name = azurerm_resource_group.mcit.name
  location            = azurerm_resource_group.mcit.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "mcit1" {
  name                = "example-linux-web-app"
  resource_group_name = azurerm_resource_group.mcit.name
  location            = azurerm_service_plan.mcit.location
  service_plan_id     = azurerm_service_plan.mcit.id

  site_config {}
}

resource "azurerm_linux_web_app_slot" "mcit" {
  name           = "mcit-slot"
  app_service_id = azurerm_linux_web_app.mcit.id

  site_config {}
}
