# Ingress firewall rule
resource "google_compute_firewall" "ssh" {
  name    = "vm-ssh"
  network = var.vpc_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["ssh"]
  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  priority      = 20
}

# Egress firewall rule
resource "google_compute_firewall" "egress" {
  name    = "egress-firewall"
  network = var.vpc_name
  project = var.project_id
  priority = 1000

  direction = "EGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
