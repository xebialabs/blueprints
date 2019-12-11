output "app_service_name" {
  value = "${azurerm_app_service.k8s.name}"
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.k8s.default_site_hostname}"
}
