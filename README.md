# Terraform-gcp-amaan

This repo is a created for the assignment for amaan terraform

# Architecture

- Region are fully on ASIA-SOUTHEAST2 which are jakarta region
- Instance are managed by instance group manager which created and manage autoscalling of instance that were created using one instance template
- Instance template are created on minimal basis and using preemptible to save cost 
- Instance also used metadata startup script to download all the necessary packages to install docker and docker-compose
- Docker-compose used to start a containers needed for wordpress
- Instance are behind a regional L4 tcp balancer to spread the load when there are multiple instances
- Firewall rule only allow http to the instances directly but this might be not needed if we are using load balancer as the frontend/endpoint
- Firewall rule allow ssh to troubleshoot startup script this can be commented later on 

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

