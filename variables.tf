variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "vms" {
  description = "A list of Cloud Compute instances definitions to create."
}

variable "vpc" {
  description = "The vpcs to be created"
}

variable "firewalls" {
  description = "The firewall rules to create"
}
