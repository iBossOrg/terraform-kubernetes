locals {
  config = merge(var.default, var.release, var.override)

  name  = lookup(local.config, "name", null)
  chart = lookup(local.config, "chart", local.name)

  default_repository  = lookup(var.default, "repository", null)
  release_repository  = lookup(var.release, "repository", null)
  override_repository = lookup(var.override, "repository", null)

  repository = merge(
    local.default_repository != null ? tomap(local.default_repository) : {},
    local.release_repository != null ? tomap(local.release_repository) : {},
    var.repository,
    local.override_repository != null ? tomap(local.override_repository) : {},
  )
  repository_name = lookup(local.repository, "name", local.name)
  repository_url = lookup(local.repository, "url",
    "https://kubernetes-charts.storage.googleapis.com/"
  )

  default_set  = lookup(var.default, "set", null)
  release_set  = lookup(var.release, "set", null)
  override_set = lookup(var.override, "set", null)

  set = merge(
    local.default_set != null ? tomap(local.default_set) : {},
    local.release_set != null ? tomap(local.release_set) : {},
    var.set,
    local.override_set != null ? tomap(local.override_set) : {},
  )

  default_set_sensitive  = lookup(var.default, "set_sensitive", null)
  release_set_sensitive  = lookup(var.release, "set_sensitive", null)
  override_set_sensitive = lookup(var.override, "set_sensitive", null)

  set_sensitive = merge(
    local.default_set_sensitive != null ? tomap(local.default_set_sensitive) : {},
    local.release_set_sensitive != null ? tomap(local.release_set_sensitive) : {},
    var.set_sensitive,
    local.override_set_sensitive != null ? tomap(local.override_set_sensitive) : {},
  )

  default_set_string  = lookup(var.default, "set_string", null)
  release_set_string  = lookup(var.release, "set_string", null)
  override_set_string = lookup(var.override, "set_string", null)

  set_string = merge(
    local.default_set_string != null ? tomap(local.default_set_string) : {},
    local.release_set_string != null ? tomap(local.release_set_string) : {},
    var.set_string,
    local.override_set_string != null ? tomap(local.override_set_string) : {},
  )
}

# TDOD: assert if local.name == null
