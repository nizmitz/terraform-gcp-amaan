resource "random_id" "instance_id" {
  byte_length = 8
}
resource "google_storage_bucket" "gcs_tf_state" {
  name          = "bucket-tfstate-${random_id.instance_id.hex}"
  force_destroy = false
  location      = "ASIA-SOUTHEAST2"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}