# Terraform modules for Kubernetes

## Terraform modules

* [Tiller](tiller/README.md) - Manages Helm's [Tiller](https://helm.sh).

## Reporting Issues

Issues can be reported by using [GitHub Issues](/../../issues). Full details on
how to report issues can be found in the [Contribution Guidelines](CONTRIBUTING.md).

## Contributing

Please read the [Contribution Guidelines](CONTRIBUTING.md), and ensure you are
signing all your commits with
[DCO sign-off](CONTRIBUTING.md#developer-certification-of-origin-dco).

### Install dependencies

Obtain access to existing Kubernetes cluster.

On Apple macOS, install the [Homebrew](https://brew.sh) package manager and
the following packages:
```bash
brew install pre-commit
brew install terraform
brew install terraform-docs
```
On other platforms, install the appropriate packages.

### Download source code

Clone the GitHub repository into your working directory:
```bash
git clone https://github.com/iBossOrg/Mk
git clone https://github.com/iBossOrg/terraform-kubernetes
cd terraform-kubernetes
```

### Usage

In the root directory, use the following commands:
```bash
make init             # Initialize Git hooks
make pre-commit       # Run Git pre-commit checks manually
```

In the module's test directories, use the following commands:
```bash
make init             # Init Terraform
make plan             # Show Terraform plan
make apply            # Create resources in Kubernetes
make output           # Show Terraform output variables
make destroy          # Destroy resources in Kubernetes
make forget           # Remove Terraform state file
make clean            # Remove all generated files
```

## Authors

* [Petr Řehoř](https://github.com/prehor) - Initial work.

See also the list of [contributors](/../../contributors) who have participated
in this project.

## License

This project is licensed under the Apache License, Version 2.0 - see the
[LICENSE](LICENSE) file for details.
