resource "azurerm_resource_group" "resource-group" {
  name     = "sample-rg-rnakamine"
  location = "japaneast"
}

resource "azurerm_storage_account" "storage-account" {
  name                     = "samplefuncrnakamine"
  resource_group_name      = azurerm_resource_group.resource-group.name
  location                 = azurerm_resource_group.resource-group.location
  account_tier             = "standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "app-service-plan" {
  name                = "sample-func-rnakamine"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  kind                = "FunctionApp"
  reserved            = true

  sku {
    size = "Y1"
    tier = "Dynamic"
  }
}

resource "azurerm_function_app" "function-app" {
  name                       = "sample-func-rnakamine"
  location                   = azurerm_resource_group.resource-group.location
  resource_group_name        = azurerm_resource_group.resource-group.name
  app_service_plan_id        = azurerm_app_service_plan.app-service-plan.id
  storage_account_name       = azurerm_storage_account.storage-account.name
  storage_account_access_key = azurerm_storage_account.storage-account.primary_access_key
  os_type                    = "linux"
  version                    = "~3"
  enable_builtin_logging     = false

  site_config {
    linux_fx_version          = "Python|3.8"
    use_32_bit_worker_process = "false"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    AzureWebJobsStorage      = azurerm_storage_account.storage-account.primary_connection_string
  }
}
