output "network_name" {
  value       = google_compute_network.default.name
  description = "VPC name"
}

output "subnet_name" {
  value       = google_compute_subnetwork.default.name
  description = "Subnet name"
}
