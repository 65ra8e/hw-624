output "auto_vpc1_id" {
  value = google_compute_network.auto-vpc1.id
  
}

output "hw_network_id" {
  value = google_compute_network.hw-network.id      
  
}

 output "hw_subnetwork_id" {
  value = google_compute_subnetwork.hw-subnetwork.id
  
}

output "hw_firewall_id" {
  value = google_compute_firewall.hw-firewall.id
  
}

output "bucket624-id" {
  value = google_storage_bucket.bucket624.id
  
}

output "hw_vm624_id" {
  value = google_compute_instance.hw-vm624.id

}


