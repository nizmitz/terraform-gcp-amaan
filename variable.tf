variable "nizmitz_cloudflare_email" {
  type = string
}
variable "nizmitz_cloudflare_api_token" {
  type = string
}
variable "gcp_project" {
  default = "clever-seat-347900"
}
variable "gcp_region" {
  default = "asia-southeast2"
}

variable "gcp_zone" {
  default = "asia-southeast2-a"
}

variable "instance_type" {
  default = "g1-small"
}