################################################################################

module "my_namespace" {
  source = "../"
  name   = "my-namespace"
}

output "my_namespace_id" {
  value = module.my_namespace.id
}

output "my_namespace_metadata" {
  value = module.my_namespace.metadata
}

################################################################################

resource "null_resource" "test" {
  triggers = { always = uuid() }
  provisioner "local-exec" {
    command = <<-EOF
      set -ex
      kubectl get namespace ${module.my_namespace.metadata.name}
    EOF
  }
}

################################################################################
