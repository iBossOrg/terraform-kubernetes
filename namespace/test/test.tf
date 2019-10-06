################################################################################

module "my_namespace" {
  source = "../"
  name   = "my-namespace"
}

################################################################################

resource "null_resource" "test" {
  triggers = { always = uuid() }
  provisioner "local-exec" {
    command = <<-EOF
      set -ex
      kubectl get namespace ${module.my_namespace.name}
    EOF
  }
}

################################################################################
