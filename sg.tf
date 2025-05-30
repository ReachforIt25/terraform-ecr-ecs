# resource "aws_security_group" "sg1" {
#   name        = "project-sg"
#   description = "Allow http"
#   vpc_id      = aws_vpc.vpc1.id


#   ingress {
#     description = "allow http"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     #cidr_blocks = ["0.0.0.0/0"]
#     security_groups = [aws_security_group.sg2.id]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     env                  = "Dev"
#     created-by-terraform = "yes"
#   }


# }
resource "aws_security_group" "sg" {
  name        = "project-sg"
  description = "Allow http and https"
  vpc_id      = aws_vpc.vpc1.id


  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    env                  = "Dev"
    created-by-terraform = "yes"
  }


}