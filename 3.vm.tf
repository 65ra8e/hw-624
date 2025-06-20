resource "google_compute_instance" "hw-vm624" {
  name                              = "hw-vm624"
  zone                              = "us-west1-b"
  machine_type                      = "n1-standard-2"
  project                           = "seahawks25"

  
  
  boot_disk {
    initialize_params {
      image                         = "debian-cloud/debian-11"
      size                          = 20
      type                          = "pd-standard"
      
    }
    
  }

  labels = {
    environment                     = "hw"
    role                            = "student"
  }
 
  
  network_interface {
    network                         = google_compute_network.hw-network.id
    subnetwork                      = google_compute_subnetwork.hw-subnetwork.id
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    email                           = "terraform-service@seahawks25.iam.gserviceaccount.com"
    scopes                          = ["https://www.googleapis.com/auth/cloud-platform"]
  }

}

resource "google_compute_disk" "disk624" {
  name                              = "disk624"
  zone                              = "us-west1-b"
  type                              = "pd-standard"
  size                              = 50 # Size in GB
  image                             = "debian-cloud/debian-11"
  
  depends_on = [google_compute_instance.hw-vm624]
  
}

resource "google_compute_attached_disk" "hw-attached-disk624" {
  instance                          = google_compute_instance.hw-vm624.id
  disk                              = google_compute_disk.disk624.id
  mode                              = "READ_WRITE"
  
  depends_on = [google_compute_disk.disk624]
  
}


