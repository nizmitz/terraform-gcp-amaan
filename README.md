# Terraform-gcp-amaan

This repo is a created for the assignment for amaan terraform

# Architecture


# Usage

before you use this repo you would need to create a new tfvars with your own values such as 
1. gcp_project
2. gcp_zone
3. gcp_region

technically you can skip the cloudflare if you don't have one and you can go without the cloudflare.tf

you will also need to do the terraform apply twice as at first the bucket are not there yet for the tfstate file
``` 
git clone https://github.com/nizmitz/terraform-gcp-amaan
//comment out all the configuration on backend.tf
terraform init
terraform plan
terraform apply
//uncomment the backend.tf
terraform apply
//yes to move the tfstate file to the gcs bucket
```

