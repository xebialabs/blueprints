output "host" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.host}"
}

output "token" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.password}"
}

output "admin_username" {
  value = "${var.linux_profile_admin_user}"
}

output "admin_private_key" {
  value = "${tls_private_key.key.private_key_pem}"
}
