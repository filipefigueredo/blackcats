variable "project" {
  description = "nmbrs project name."
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "list of nmbrs mandatory resource tags."
}

variable "environment" {
  type        = string
  description = "environment type of the apps"
  default     = "development"
}

variable "kitchen_name" {
  type        = string
  description = "Kitchen name to be used in the naming construction"
}
