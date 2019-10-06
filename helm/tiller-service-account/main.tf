resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = local.name
    namespace = local.namespace
  }
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = local.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = local.cluster_role
  }

  subject {
    kind      = "ServiceAccount"
    name      = local.name
    namespace = local.namespace
  }
}
