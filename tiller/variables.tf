variable "dependencies" {
  description = "Dependencies to be created before this module"
  type        = list(string)
  default     = null
}

variable "image_tag" {
  description = "Tiller image tag"
  type        = string
  default     = "v2.14.3"
}

variable "image_pull_policy" {
  description = "Tiller image pull policy"
  type        = string
  default     = "IfNotPresent"
}

variable "replica_count" {
  description = "Tiller pod replicas"
  type        = number
  default     = 1
}

variable "history_max" {
  description = ""
  type        = string
  default     = 200
}
