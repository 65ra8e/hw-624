resource "google_storage_bucket" "bucket624" {
    name                        = "seahawks25-bucket624"
    location                    = "us-west1"
    force_destroy               = true
    uniform_bucket_level_access = true
    storage_class               = "ARCHIVE"

    lifecycle_rule {
      condition {
        age = 1
}

        action {
            type                = "SetStorageClass"
            storage_class       = "coldline"
        }
}
retention_policy {
    retention_period            = 3600 # 1 hour in seconds 
    is_locked                   = true
} 


}


resource "google_storage_bucket_object" "object624" {
    name                        = "object624.txt"
    bucket                      = google_storage_bucket.bucket624.name
    content                     = "This is a test object in the bucket."
}


