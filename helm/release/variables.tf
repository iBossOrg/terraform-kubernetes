variable "default" {
  description = "Default Helm release configuration"
  default     = null
}

variable "override" {
  description = "Override Helm release configuration"
  default     = null
}

variable "repository" {
  description = "Helm repository configuration"
  default     = null
}

variable "release" {
  description = "Helm release configuration"
  default     = null
}

variable "set" {
  description = "Chart values"
  default     = null
}

variable "set_sensitive" {
  description = "Chart sensitive values"
  default     = null
}

variable "set_string" {
  description = "Chart string values"
  default     = null
}
