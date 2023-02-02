provider "azurerm" {
  version = "2.24.0"
}

module "web_app" {
  source = "./module"

  repository_name = var.repository_name
  project_name    = var.project_name
  app_name        = var.app_name
  environment     = var.environment
  web_app_name    = var.web_app_name
}

provider "azurerm" {
  version = "2.24.0"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "<Your Azure Storage Account Name>"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
