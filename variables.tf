resource "azurerm_linux_virtual_machine_scale_set" "this" {
  name                            = format("%s", local.vm_name)
  resource_group_name             = var.resource_group_name
  location                        = var.location
  s
ku                             = var.sku
  instances                       = 0
  admin_username                  = var.username
  admin_password                  = var.password
  disable_password_authentication = false
  do_not_run_extensions_on_overprovisioned_machines = true
  upgrade_mode                    = "Manual"
  tags                            = local.tags

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  network_interface {
    name    = local.network_interface_name
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }

  os_disk {
    storage_account_type = "StandardSSD_LRS"
    caching              = "ReadWrite"
  }

}
