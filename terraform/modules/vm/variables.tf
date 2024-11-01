variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the subnetwork"
}

variable "zone" {
  type        = string
  description = "GCP zone for VM"
}

variable "vm_machine_type" {
  type        = string
  description = "Machine type for VM"
}

variable "prefix" {
  type        = string
  default     = "main"
}
