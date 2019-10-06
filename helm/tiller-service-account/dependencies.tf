data "null_data_source" "dependencies" {
  inputs = {
    dependencies = var.dependencies == null ? "" : join(",", var.dependencies)
    name         = var.name
    namespace    = var.namespace
    cluster_role = var.cluster_role
  }
}

locals {
  name         = data.null_data_source.dependencies.outputs.name
  namespace    = data.null_data_source.dependencies.outputs.namespace
  cluster_role = data.null_data_source.dependencies.outputs.cluster_role
}
