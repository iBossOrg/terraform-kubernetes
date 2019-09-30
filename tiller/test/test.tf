################################################################################

provider "kubernetes" {
  config_path = "kubeconfig.yaml"
}

################################################################################

module "tiller" {
  source = "../"
  providers = {
    kubernetes = "kubernetes"
  }
}

################################################################################

resource "null_resource" "tiller" {
  depends_on = [module.tiller]
  triggers   = { always = uuid() }
  provisioner "local-exec" {
    command = <<-EOF
      set -ex
      export KUBECONFIG=kubeconfig.yaml
      kubectl get all --all-namespaces
      helm version
    EOF
  }
}

################################################################################
