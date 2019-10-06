resource "kubernetes_namespace" "namespace" {
  metadata {
    name        = var.name
    annotations = var.annotations
    labels      = var.labels
  }
}
