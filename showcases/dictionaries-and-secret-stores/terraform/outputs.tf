output "ip_address" {
  value = "${data.azurerm_public_ip.myterraformpublicip.ip_address}"
}
