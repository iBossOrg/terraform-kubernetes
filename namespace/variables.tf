variable "annotations" {
  description = "Annotations"
  type        = map(string)
  default     = null
}

variable "dependencies" {
  description = "Dependencies to be created before this module"
  type        = list(string)
  default     = null
}

variable "labels" {
  description = "Labels"
  type        = map(string)
  default     = null
}

variable "name" {
  description = "Namespace name"
  type        = string
}
