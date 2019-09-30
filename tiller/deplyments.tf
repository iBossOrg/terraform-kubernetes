resource "kubernetes_deployment" "tiller" {
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
    replicas                  = var.replica_count
    progress_deadline_seconds = 2147483647
    revision_history_limit    = 2147483647

    selector {
      match_labels = {
        app  = "helm"
        name = "tiller"
      }
    }

    strategy {
      rolling_update {
        max_surge       = 1
        max_unavailable = 1
      }
    }

    template {
      metadata {
        labels = {
          app  = "helm"
          name = "tiller"
        }
      }

      spec {
        service_account_name = "tiller"

        container {
          name              = "tiller"
          image             = "gcr.io/kubernetes-helm/tiller:${var.image_tag}"
          image_pull_policy = var.image_pull_policy

          env {
            name  = "TILLER_NAMESPACE"
            value = "kube-system"
          }

          env {
            name  = "TILLER_HISTORY_MAX"
            value = var.history_max
          }

          port {
            container_port = 44134
            name           = "tiller"
          }

          port {
            container_port = 44135
            name           = "http"
          }

          liveness_probe {
            initial_delay_seconds = 1
            timeout_seconds       = 1

            http_get {
              path = "/liveness"
              port = 44135
            }
          }

          readiness_probe {
            initial_delay_seconds = 1
            timeout_seconds       = 1

            http_get {
              path = "/readiness"
              port = 44135
            }
          }

          resources {}
        }
      }
    }
  }
}
