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
variable "release" {
  description = "Helm release configuration"
  default = null
}

provider "helm" {}

module "my_chart" {
  source    = "github.com/iBossOrg/terraform-kubernetes/helm/release"
  providers = { helm = "helm" }
  release   = var.release
  override  = { chart = "my_chart" }
  # Insert optional input variables here
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
