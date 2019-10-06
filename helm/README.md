# Helm module

Support for [Helm](https://helm.sh) package manager.

## Terraform modules

* [Tiller Service Account](tiller-service-account/README.md) - Manages [Tiller's](https://helm.sh/docs/using_helm/#tiller-and-role-based-access-control) service account.

## Prerequisities

Obtain access to existing Kubernetes cluster.

On Apple macOS, install the [Homebrew](https://brew.sh) package manager and the following packages:
```bash
brew install terraform
brew install kubernetes-cli
brew install kubernetes-helm
```
On other platforms, install the appropriate packages.

## Usage

Copy and paste into your Terraform configuration and insert input variables:
```hcl
provider "helm" {
  init_helm_home  = true
  install_tiller  = true
  service_account = "tiller"
  max_history     = 200
  # insecure      = true
}

module "tiller_service_account" {
  source   = "github.com/iBossOrg/terraform-kubernetes/helm/tiller_service_account"
  # Insert optional input variables here
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
