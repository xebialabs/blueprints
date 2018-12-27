provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

resource "aws_ecs_service" "ecs-service" {
  name                               = "${var.app_name}-ecs-service"
  cluster                            = "${var.app_name}-ecs-cluster"
  deployment_controller {
    type                             = "ECS"
  }
  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "1"
  enable_ecs_managed_tags            = "false"
  health_check_grace_period_seconds  = "0",
  launch_type                        = "FARGATE"
  load_balancer{
    container_name                   = "${var.app_name}-app"
    container_port                   = "8080"
    elb_name                         = ""
    target_group_arn                 = "Name:${var.app_name}-ecs-alb-target-group"
  }
  network_configuration {
    assign_public_ip                 = "true",
    security_groups                  = ["Name:${var.app_name}-ecs-security-group"]
    subnets                          = ["${var.app_name}-ecs-subnet-ipv4-az-1a",
                                        "${var.app_name}-ecs-subnet-ipv4-az-1b"]
  }
  scheduling_strategy                = "REPLICA",
  task_definition                    = "${aws_ecs_task_definition.ecs-task-definition.arn}"
}

resource "aws_ecs_task_definition" "ecs-task-definition" {
  tags {
    Name                   = "${var.app_name}-ecs-alb-target-group"
  }
  cpu                      = "2048"
  execution_role_arn       = "Name:${var.app_name}-ecs-task-execution-role"
  family                   = "${var.app_name}-ecs-task-definition"
  memory                   = "4096"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = ""
  container_definitions    = <<-JSON
  [
    {
      "name": "${var.app_name}-app",
      "image": "xebialabsunsupported/ecommerce-monolith",
      "command": [],
      "cpu": 1024,
      "environment": [
        {
          "name": "SPRING_DATASOURCE_USERNAME",
          "value": "store"
        },
        {
          "name": "SPRING_DATASOURCE_URL",
          "value": "jdbc:mysql://${var.mysql_address}:${var.mysql_port}/store?useUnicode=true&characterEncoding=utf8&useSSL=false"
        },
        {
          "name": "SPRING_DATASOURCE_PASSWORD",
          "value": "${var.mysql_master_password}"
        },
        {
          "name": "SPRING_PROFILES_ACTIVE",
          "value": "prod,swagger"
        }
      ],
      "essential": true,
      "links": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/ecommerce",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "ecs-ecommerce"
        }
      },
      "memoryReservation": 768,
      "mountPoints": [],
      "portMappings": [
        {
          "containerPort": 8080,
          "hostPort": 8080,
          "protocol": "tcp"
        }
      ],
      "volumesFrom": []
    }
  ]
  JSON
}