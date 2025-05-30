# variable "access_key" {
#     type = string  
#     default = ""
# }
# variable "secret_key" {
#   type = string
#   default = ""
# }

variable "region" {
  description = "your region"
  type        = string
  default     = "us-east-1"

}
# variable "aws_lb_target_group" {


# }

# variable "aws_container-port" {

# }

variable "ecr_repository_name" {
  description = "ECR repositry name"
  default     = "ecr-project-repo"

}