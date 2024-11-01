variable "vpc_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the subnetwork for the NAT gateway"
}

variable "region" {
  type        = string
  description = "The region where the NAT gateway will be created"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}