# Fournisseur
provider "azurerm" {
  features {}

# Optionnel: spécifie l'ID de la souscription si nécessaire
  subscription_id = "00000000-0000-0000-0000-0000000000000"
}

# Groupe de ressources
resource "azurerm_resource_group" "rom1" {
  name     = "rom1-tf"
  location = "East US"
}