
resource "azurerm_kubernetes_cluster_node_pool" "gameon" {
for_each= azurerm_kubernetes_cluster.kubernetestest 
name                  = "${each.key}"
  kubernetes_cluster_id = each.value.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

  tags = {
    Environment = "Production"
  }
}
