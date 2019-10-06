variable "cluster_role" {
  description = "Cluster role to which the Tiller service account will be bound"
  type        = string
  default     = "cluster-admin"
}
variable "dependencies" {
  description = "Dependencies to be created before this module"
  type        = list(string)
  default     = null
}

variable "name" {
  description = "Service account to install Tiller with"
  type        = string
  default     = "tiller"
}

variable "namespace" {
  description = "Alternative Tiller namespace"
  type        = string
  default     = "kube-system"
}
