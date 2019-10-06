variable "annotations" {
  description = "namespace annotations"
  type        = map(string)
  default     = null
}

variable "labels" {
  description = "Namespace labels"
  type        = map(string)
  default     = null
}

variable "name" {
  description = "Name of the namespace"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Name prefix of the namespace"
  type        = string
  default     = null
}
