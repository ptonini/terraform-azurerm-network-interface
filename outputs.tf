output "this" {
  value = azurerm_network_interface.this
}

output "public_ip" {
  value = var.public_ip ? azurerm_public_ip.this[0].ip_address : null
}