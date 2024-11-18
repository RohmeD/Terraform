# Réseau virtuel
resource "azurerm_virtual_network" "rom1" {
  name                = "rom1-vnet"
  location            = azurerm_resource_group.rom1.location
  resource_group_name = azurerm_resource_group.rom1.name
  address_space       = ["10.0.0.0/16"]
}

# Sous-réseau
resource "azurerm_subnet" "rom1" {
  name                 = "rom1-subnet"
  resource_group_name  = azurerm_resource_group.rom1.name
  virtual_network_name = azurerm_virtual_network.rom1.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Interface réseau
resource "azurerm_network_interface" "rom1" {
  name                = "rom1-nic"
  location            = azurerm_resource_group.rom1.location
  resource_group_name = azurerm_resource_group.rom1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.rom1.id
    private_ip_address_allocation = "Dynamic"
  }
}