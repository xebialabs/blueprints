output "ip_address" {
  value = "${data.azurerm_public_ip.terraformpublicip.ip_address}"
}
