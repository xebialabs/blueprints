##################################################################################
# OUTPUTS
##################################################################################
output "host" {
  value = "${azurerm_kubernetes_cluster.aks.kube_admin_config.0.host}"
}

output "token" {
  value = "${azurerm_kubernetes_cluster.aks.kube_admin_config.0.password}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.aks.kube_admin_config_raw}"
}
