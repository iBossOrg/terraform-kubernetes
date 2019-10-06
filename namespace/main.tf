resource "kubernetes_namespace" "namespace" {
  metadata {
    name        = local.name
    annotations = var.annotations
    labels      = var.labels
  }
}
