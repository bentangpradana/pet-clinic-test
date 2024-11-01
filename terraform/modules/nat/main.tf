resource "google_compute_router" "nat_router" {
  name    = "my-nat-router"
  network = var.vpc_name
  region  = var.region
  project = var.project_id

  bgp {
    asn = 65001  # ASN default, bisa disesuaikan
  }
}

resource "google_compute_router_nat" "nat_gateway" {
  name                    = "my-nat-gateway"
  router                  = google_compute_router.nat_router.name
  nat_ip_allocate_option  = "AUTO_ONLY"
  project                 = var.project_id
  region                  = var.region
  
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
 
}
