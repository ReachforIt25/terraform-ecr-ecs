resource "aws_ecs_cluster" "ecs" {
  name = "project_cluster"

}

resource "aws_ecs_service" "service" {
  name                   = "project_service"
  cluster                = aws_ecs_cluster.ecs.arn
  launch_type            = "FARGATE"
  enable_execute_command = true

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  task_definition                    = aws_ecs_task_definition.task.arn

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [aws_subnet.sub1.id, aws_subnet.sub2.id ]
  }
}

resource "aws_ecs_task_definition" "task" {
  family = "service"

  container_definitions = jsonencode([
    {
      name      = "project"
      image     = "service-first"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 5001
          hostPort      = 5001
        }
      ]
    }
  ])

  requires_compatibilities = ["FARGATE"]

  cpu                = "256"
  memory             = "512"
  network_mode       = "awsvpc"
  task_role_arn      = "arn:aws:iam::571600845324:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::571600845324:role/ecsTaskExecutionRole"
}