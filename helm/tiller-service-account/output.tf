output "generation" {
  description = "Tiller service account generation"
  value       = kubernetes_service_account.tiller.metadata.0.generation
}

output "id" {
  description = "Tiller service account id"
  value       = kubernetes_service_account.tiller.id
}

output "name" {
  description = "Tiller service account name"
  value       = kubernetes_service_account.tiller.metadata.0.name
}

output "namespace" {
  description = "Tiller service account namespace"
  value       = kubernetes_service_account.tiller.metadata.0.namespace
}
