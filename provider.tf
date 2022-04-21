terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.20"

    }
  }
}

provider "cloudflare" {
  email     = var.nizmitz_cloudflare_email
  api_token = var.nizmitz_cloudflare_api_token
}

provider "google" {
  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone
}