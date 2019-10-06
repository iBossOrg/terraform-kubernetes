data "null_data_source" "namespace" {
  inputs = {
    id       = kubernetes_namespace.namespace.id
    metadata = jsonencode(kubernetes_namespace.namespace.metadata.0)
  }
}

output "id" {
  description = "Name of the namespace"
  value       = data.null_data_source.namespace.outputs.id
}

output "metadata" {
  description = "Metadata of the namespace"
  value       = jsondecode(data.null_data_source.namespace.outputs.metadata)
}
