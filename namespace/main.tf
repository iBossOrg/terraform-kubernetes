resource "kubernetes_namespace" "namespace" {
  metadata {
    name          = var.name
    generate_name = var.name_prefix
    annotations   = var.annotations
    labels        = var.labels
  }
}
