resource "azurerm_linux_virtual_machine_scale_set" "this" {
  name                            = format("%s", local.vm_name)
  resource_group_name             = var.resource_group_name
  location                        = var.location
  s
ku                             = var.sku
 
