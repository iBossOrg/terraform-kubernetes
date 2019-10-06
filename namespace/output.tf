data "null_data_source" "namespace" {
  depends_on = [kubernetes_namespace.namespace]
  inputs = {
    name = var.name
  }
}

output "name" {
  description = "Namespace name"
  value       = data.null_data_source.namespace.outputs.name
}
