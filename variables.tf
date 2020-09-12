variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation"
  default     = "terraform"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = "dev"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'jenkins'"
  default     = "app"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "additional_tag_map" {
  type        = map(string)
  default     = {}
  description = "Additional tags for appending to each tag map"
}

variable "user" {
  type        = string
  description = "Name of the user who manages the infrastructure."
  default     = "dev"
}
