data "null_data_source" "dependencies" {
  inputs = {
    dependencies = var.dependencies == null ? "" : join(",", var.dependencies)
    name         = var.name
  }
}

locals {
  name = data.null_data_source.dependencies.outputs.name
}
