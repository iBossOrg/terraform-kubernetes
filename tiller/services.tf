resource "kubernetes_service" "tiller" {
  depends_on = [module.dependencies]

  metadata {
    namespace = "kube-system"
    name      = "tiller"

    labels = {
      app  = "helm"
      name = "tiller"
    }
  }

  spec {
    type = "ClusterIP"

    selector = {
      app  = "helm"
      name = "tiller"
    }

    port {
      port        = 44134
      name        = "tiller"
      target_port = "tiller"
    }
  }
}
