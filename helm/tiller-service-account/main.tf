resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = var.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = var.cluster_role
  }

  subject {
    kind      = "ServiceAccount"
    name      = var.name
    namespace = var.namespace
  }
}
