output "host" {
  value = "${module.aks.host}"
}

output "password" {
  value = "${module.aks.password}"
}

output "client_certificate" {
  value = "${module.aks.client_certificate}"
}
