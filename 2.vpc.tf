resource "google_compute_network" "auto-vpc1" {
  name                            = "auto-vpc1"
  auto_create_subnetworks         = true
  routing_mode                    = "REGIONAL"
  
}

resource "google_compute_network" "hw-network" {
  name                            = "hw-network"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "hw-subnetwork" {
    name                          = "hw-subnetwork"
    region                        = "us-west1"
    network                       = google_compute_network.hw-network.id
    ip_cidr_range                 = "10.48.24.0/24"
    private_ip_google_access      = true
}

resource "google_compute_firewall" "hw-firewall" {
    name                          = "hw-firewall"
    network                       = google_compute_network.hw-network.id
    allow {
        protocol                  = "tcp"
        ports                     = ["22", "80", "443"]
}
    allow {
        protocol                  = "icmp"
    }
    
    source_ranges                 = ["0.0.0.0/0"]
}