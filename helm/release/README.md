# Helm Release module

Simplify the use of Helm release in modules.

## Prerequisities

Obtain access to existing Kubernetes cluster.

On Apple macOS, install the [Homebrew](https://brew.sh) package manager and
the following packages:
```bash
brew install terraform
brew install kubernetes-cli
brew install kubernetes-helm
```
On other platforms, install the appropriate packages.

## Usage

Copy and paste into your Terraform module:
```hcl
provider "helm" {}

variable "repository" {
  description = "Helm repository configuration"
  default     = {}
}

variable "release" {
  description = "Helm release configuration"
  default     = {}
}

variable "set" {
  description = "Chart values"
  default     = {}
}

variable "set_sensitive" {
  description = "Chart sensitive values"
  default     = {}
}

variable "set_string" {
  description = "Chart string values"
  default     = {}
}

locals {
  default = {
    name = "my-chart"
    # ...
  }
  override = {
    chart = "my-chart"
    # ...

    repository = {
      # ...
    }
  }
}

module "my_chart" {
  source        = "github.com/iBossOrg/terraform-kubernetes/helm/release"
  providers     = { helm = "helm" }
  repository    = var.repository
  default       = local.default
  release       = var.release
  override      = local.override
  set           = var.set
  set_sensitive = var.set_sensitive
  set_string    = var.set_string
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
