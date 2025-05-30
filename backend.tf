terraform {
  backend "s3" {
    bucket = "marylaures-"
    key = "terraformbackend-folder/terraform-state-file"
    region = "us-east-1"
    encrypt = true
    
  }
}