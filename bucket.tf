resource "random_id" "instance_id" {
  byte_length = 8
}
resource "google_storage_bucket" "default" {
  name          = "bucket-tfstate-amaan-testing-fattahemiryanuar"
  force_destroy = false
  location      = "ASIA-SOUTHEAST2"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}