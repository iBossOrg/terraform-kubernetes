################################################################################

module "tiller_service_account" {
  source = "../"
}

output "tiller_service_account" {
  value = module.tiller_service_account
}

################################################################################

resource "null_resource" "tiller_service_account_test" {
  triggers = { always = uuid() }
  provisioner "local-exec" {
    command = <<-EOF
      set -ex
      sleep 1
      kubectl get serviceaccount --namespace "kube-system" "tiller"
      kubectl get clusterrolebindings --namespace "kube-system" "tiller"
    EOF
  }
}

################################################################################
