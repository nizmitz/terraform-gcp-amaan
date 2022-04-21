
terraform {
  backend "gcs" {
    bucket = "bucket-tfstate-9e02a1a4f7803556"
    prefix = "terraform/state"
  }
}
