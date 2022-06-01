variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "vms" {
  description = "A list of Cloud Compute instances definitions to create."
}
