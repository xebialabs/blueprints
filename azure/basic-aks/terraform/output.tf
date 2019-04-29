output "host" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.host}"
}

output "token" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.password}"
}

output "admin_username" {
  value = "${azurerm_kubernetes_cluster.k8s.linux_profile.admin_username}"
}

# TODO: Is this safe to export? Is it needed?
output "admin_private_key" {
  value = "${tls_private_key.key.private_key_pem}"
}
