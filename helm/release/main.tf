locals {
  default  = var.default != null ? var.default : {}
  override = var.override != null ? var.override : {}
  release  = var.release != null ? var.release : {}
  config   = merge(local.default, local.release, local.override)

  name  = lookup(local.config, "name", null)
  chart = lookup(local.config, "chart", local.name)

  repository_name = lookup(local.repository, "name", local.name)
  repository_url = lookup(local.repository, "url",
    "https://kubernetes-charts.storage.googleapis.com/"
  )

  default_repository     = lookup(local.default, "repository", null)
  default_set            = lookup(local.default, "set", null)
  default_set_sensitive  = lookup(local.default, "set_sensitive", null)
  default_set_string     = lookup(local.default, "set_string", null)
  release_repository     = lookup(local.release, "repository", null)
  release_set            = lookup(local.release, "set", null)
  release_set_sensitive  = lookup(local.release, "set_sensitive", null)
  release_set_string     = lookup(local.release, "set_string", null)
  override_repository    = lookup(local.override, "repository", null)
  override_set           = lookup(local.override, "set", null)
  override_set_sensitive = lookup(local.override, "set_sensitive", null)
  override_set_string    = lookup(local.override, "set_string", null)

  repository = merge(
    local.default_repository != null ? tomap(local.default_repository) : {},
    local.release_repository != null ? tomap(local.release_repository) : {},
    var.repository != null ? tomap(var.repository) : {},
    local.override_repository != null ? tomap(local.override_repository) : {},
  )

  set = merge(
    local.default_set != null ? tomap(local.default_set) : {},
    local.release_set != null ? tomap(local.release_set) : {},
    var.set != null ? tomap(var.set) : {},
    local.override_set != null ? tomap(local.override_set) : {},
  )

  set_sensitive = merge(
    local.default_set_sensitive != null ? tomap(local.default_set_sensitive) : {},
    local.release_set_sensitive != null ? tomap(local.release_set_sensitive) : {},
    var.set_sensitive != null ? tomap(var.set_sensitive) : {},
    local.override_set_sensitive != null ? tomap(local.override_set_sensitive) : {},
  )

  set_string = merge(
    local.default_set_string != null ? tomap(local.default_set_string) : {},
    local.release_set_string != null ? tomap(local.release_set_string) : {},
    var.set_string != null ? tomap(var.set_string) : {},
    local.override_set_string != null ? tomap(local.override_set_string) : {},
  )
}

# TDOD: assertion on name

data "helm_repository" "chart" {
  name      = local.repository_name
  url       = local.repository_url
  key_file  = lookup(local.repository, "rkey_file", null)
  cert_file = lookup(local.repository, "cert_file", null)
  ca_file   = lookup(local.repository, "ca_file", null)
  username  = lookup(local.repository, "username", null)
  password  = lookup(local.repository, "password", null)
}

resource "helm_release" "chart" {
  name             = local.name
  repository       = data.helm_repository.chart.metadata.0.name
  chart            = local.chart
  devel            = lookup(local.config, "devel", null)
  version          = lookup(local.config, "version", null)
  values           = lookup(local.config, "values", null)
  namespace        = lookup(local.config, "namespace", null)
  verify           = lookup(local.config, "verify", null)
  keyring          = lookup(local.config, "keyring", null)
  timeout          = lookup(local.config, "timeout", null)
  disable_webhooks = lookup(local.config, "disable_webhooks", null)
  reuse            = lookup(local.config, "reuse", null)
  reuse_values     = lookup(local.config, "reuse_values", null)
  force_update     = lookup(local.config, "force_update", null)
  recreate_pods    = lookup(local.config, "recreate_pods", null)
  wait             = lookup(local.config, "wait", null)

  dynamic "set" {
    for_each = local.set

    content {
      name  = set.key
      value = set.value
    }
  }

  dynamic "set_sensitive" {
    for_each = local.set_sensitive

    content {
      name  = set_sensitive.key
      value = set_sensitive.value
    }
  }

  dynamic "set_string" {
    for_each = local.set_string

    content {
      name  = set_string.key
      value = set_string.value
    }
  }
}
