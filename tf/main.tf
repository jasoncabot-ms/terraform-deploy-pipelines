resource "azurerm_resource_group" "rg" {
  name     = "terraform-deploy"
  location = "West Europe"

  tags = {
    mode = "ci"
  }
}

resource "azurerm_storage_account" "tfdeploysa" {
  name                     = "tfdeploysa"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}