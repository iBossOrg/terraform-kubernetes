# Tiller Service Account module

Manages [Tiller service account](https://helm.sh/docs/using_helm/#tiller-and-role-based-access-control).

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
  source = "github.com/iBossOrg/terraform-kubernetes/helm/tiller-service-account"
  # Insert input variables here
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
