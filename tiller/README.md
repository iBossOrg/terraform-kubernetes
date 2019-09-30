# Tiller module

Manages Helm's [Tiller](https://helm.sh).

## Prerequisities

Obtain access to existing Kubernetes cluster.

On Apple macOS, install the [Homebrew](https://brew.sh) package manager and
the following packages:
```bash
brew install terraform
```
On other platforms, install the appropriate packages.

## Usage

Copy and paste into your Terraform configuration and insert input variables:
```hcl
module "tiller" {
  source   = "github.com/iBossOrg/terraform-kubernetes/tiller"
  # Insert optional input variables here
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
