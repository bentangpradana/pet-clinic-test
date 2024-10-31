#Ingress firewall rules
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
  priority      = "20"
}

# Egress rules
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

resource "google_compute_router" "nat_router" {
  name    = "my-nat-router"
  network = google_compute_network.default.self_link
  project = var.project_id
}

resource "google_compute_router_nat" "nat_gateway" {
  name                    = "my-nat-gateway"
  router                  = google_compute_router.nat_router.name
  nat_ip_allocate_option   = "AUTO_ONLY"
  project                 = var.project_id  # Optionally add the project ID here as well

  # Allow all subnetwork IP ranges to use NAT
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  # Define specific subnets that should route through the NAT gateway
  subnetwork {
    name                   = google_compute_subnetwork.default.name
    source_ip_ranges_to_nat = ["10.0.0.0/24"]
  }
}
