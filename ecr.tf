module "ecr_repositry" {
    source = "../module/ecr"
    ecr_repositry_name = var.ecr_repositry_name
  
}