variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south2" # Default region, bisa diubah sesuai kebutuhan
}

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}
