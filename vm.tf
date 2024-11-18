# Machine virtuelle dans le groupe de ressources 'rom1'
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "rom1-vm"
  resource_group_name = azurerm_resource_group.rom1.name
  location            = azurerm_resource_group.rom1.location
  size                = "Standard_B1s"
  admin_username      = "rom1"
  admin_password      = "YourStrongPassword123!"  # Remplacez par un mot de passe fort
  disable_password_authentication = false         # Désactive l'exigence de clé SSH  

# Mettre une clé ssh pour l'admin
#  admin_ssh_key {
#   username   = "azureuser"
#    public_key = file("~/.ssh/id_rsa.pub")
# }

# Référence à l'interface réseau associée 
  network_interface_ids = [
    azurerm_network_interface.rom1.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_reference {
  publisher = "Debian"
  offer     = "debian"
  sku       = "11"
  version   = "latest"
}
}