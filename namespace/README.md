# Namespace module

Manages Kubernetes namespace.

## Prerequisities

Obtain access to existing Kubernetes cluster.

On Apple macOS, install the [Homebrew](https://brew.sh) package manager and
the following packages:
```bash
brew install terraform
brew install kubernetes-cli
```
On other platforms, install the appropriate packages.

## Usage

Copy and paste into your Terraform configuration and insert input variables:
```hcl
module "my_namespace" {
  source = "github.com/iBossOrg/terraform-kubernetes/namespace"
  # Insert input variables here
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
