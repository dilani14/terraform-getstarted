terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "2.57"
    }
  }
  required_version = "0.15.3"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

### Resource Group ###
resource "azurerm_resource_group" "sdf_rg" {
  name = "${var.project}-${var.service}-${var.environment}-rg"
  location = "East Asia"
}

### App Service Plan ###
resource "azurerm_app_service_plan" "sdf_asp" {
  name = "${var.project}-${var.service}-${var.environment}-asp"
  resource_group_name = azurerm_resource_group.sdf_rg.name
  location = azurerm_resource_group.sdf_rg.location

  sku {
    tier = "Standard"
    size = "S1"
  }
}

### App Service ###
resource "azurerm_app_service" "sdf_as" {
  name = "${var.project}-${var.service}-${var.environment}-as"
  resource_group_name = azurerm_resource_group.sdf_rg.name
  location = azurerm_resource_group.sdf_rg.location

  app_service_plan_id = azurerm_app_service_plan.sdf_asp.id

  app_settings = {
    "Environment" = "Development"
  }
}

### SQL Server ###
resource "azurerm_sql_server" "sdf_server" {
  name = "${var.project}-${var.service}-${var.environment}-server"
  resource_group_name = azurerm_resource_group.sdf_rg.name
  location = azurerm_resource_group.sdf_rg.location

  version = "12.0"

  administrator_login = var.admin_login
  administrator_login_password = var.admin_pwd
}

### SQL database ###
resource "azurerm_sql_database" "sdf_db" {
  name = "${var.project}-${var.service}-${var.environment}-db"
  resource_group_name = azurerm_resource_group.sdf_rg.name
  location = azurerm_resource_group.sdf_rg.location

  server_name = azurerm_sql_server.sdf_server.name
}