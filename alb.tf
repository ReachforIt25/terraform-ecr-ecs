// target group
resource "aws_lb_target_group" "tg1" {
  name        = "alb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc1.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
  depends_on = [aws_vpc.vpc1]

}

# create ALB
resource "aws_lb" "alb1" {
  name                       = "alb-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg.id]
  subnets                    = [aws_subnet.sub1.id, aws_subnet.sub2.id]
  enable_deletion_protection = false
}

# create listner
resource "aws_lb_listener" "listner1" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }


}
