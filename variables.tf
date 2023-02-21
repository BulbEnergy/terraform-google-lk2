variable "project_id" {
  type        = string
  description = "The project ID to create the resources in"
}

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "roles" {
  type = set(string)

  default = []
}

variable "workload_identity" {
  type = object({
    name      = string
    namespace = string
  })

  default = null
}
