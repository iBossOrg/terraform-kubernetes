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
