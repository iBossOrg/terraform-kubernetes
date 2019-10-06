output "generation" {
  description = "Namespace generation"
  value       = kubernetes_namespace.namespace.metadata.0.generation
}

output "id" {
  description = "Namespace id"
  value       = kubernetes_namespace.namespace.id
}

output "name" {
  description = "Namespace name"
  value       = kubernetes_namespace.namespace.metadata.0.name
}
