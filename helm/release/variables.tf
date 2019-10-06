variable "default" {
  description = "Default Helm release configuration"
  default     = {}
}

variable "override" {
  description = "Override Helm release configuration"
  default     = {}
}

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
