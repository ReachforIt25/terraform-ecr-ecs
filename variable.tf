# variable "access_key" {
#     type = string  
#     default = "AKIAYKFQQXIGG"
# }
# variable "secret_key" {
#   type = string
#   default = "Q5Nv707kZCHLQK9cPVg7U0XUS2zXw"
# }

variable "region" {
  description = "your region"
  type = string
  default = "us-east-1"
  
}
# variable "aws_lb_target_group" {

  
# }

# variable "aws_container-port" {
  
# }

variable "ecr_repositry_name" {
  description = "ECR repositry name"
  default = "ecr-project-repo"
  
}