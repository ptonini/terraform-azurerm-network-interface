resource "azurerm_public_ip" "this" {
  count = var.public_ip ? 1 : 0
  name = var.name
  resource_group_name = var.rg.name
  location = var.rg.location
  sku = var.public_ip_sku
  allocation_method = var.public_ip_allocation_method
  zones = [1, 2, 3]
}

resource "azurerm_network_interface" "this" {
  name = var.name
  location = var.rg.location
  resource_group_name = var.rg.name
  ip_configuration {
    name = "internal"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = try(azurerm_public_ip.this[0].id, null)
  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id = azurerm_network_interface.this.id
  network_security_group_id = var.security_group_id
}