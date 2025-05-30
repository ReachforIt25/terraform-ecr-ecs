terraform {
  backend "s3" {
    bucket  = "marylaures-aws-bucket-w10"
    key     = "terraformbackend-folder/terraform-state-file"
    region  = "us-east-1"
    encrypt = true

  }
}