################################################################################

provider "helm" {
  init_helm_home  = true
  install_tiller  = true
  service_account = "tiller"
  max_history     = 200
  insecure        = true
}

module "tiller_service_account" {
  source = "github.com/iBossOrg/terraform-kubernetes/helm/tiller-service-account"
}

################################################################################

module "kubernetes_dashboard" {
  source    = "../"
  providers = { helm = "helm" }
  default   = { name = "kubernetes-dashboard" }
  override  = { chart = "kubernetes-dashboard" }
  set       = { "rbac.create" = true }
}

output "kubernetes_dashboard" {
  value = module.kubernetes_dashboard
}

################################################################################

resource "null_resource" "test" {
  triggers = {
    always     = uuid()
    depends_on = module.kubernetes_dashboard.result.name
  }
  provisioner "local-exec" {
    command = <<-EOF
      set -ex
      sleep 1
      kubectl get all --all-namespaces
    EOF
  }
}

################################################################################
