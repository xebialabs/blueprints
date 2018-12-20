# terraform import -var-file=terraform.tfvars aws_vpc.jkmonolith-ecs-vpc jkmonolith-ecs-vpc
# {{$app := .AppName | kebabcase}}
# https://www.terraform.io/docs/import/usage.html
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "app_name" {
  default = "jk2monolith"
}
variable "region" {
  default = "eu-west-1"
}


variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

resource "aws_vpc" "jkmonolith-ecs-vpc" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"
  tags {
      Name             = "jkmonolith-ecs-vpc"
  }
}

resource "aws_subnet" "jkmonolith-ecs-subnet-ipv4-az-1a" {
  availability_zone = "${var.region}a"
  vpc_id            = "${aws_vpc.jkmonolith-ecs-vpc.id}"
  cidr_block        = "10.0.0.0/24"
  tags {
      Name          = "jkmonolith-ecs-subnet-ipv4-az-1a"
  }
}

resource "aws_subnet" "jkmonolith-ecs-subnet-ipv4-az-1b" {
  availability_zone = "${var.region}b"
  vpc_id            = "${aws_vpc.jkmonolith-ecs-vpc.id}"
  cidr_block        = "10.0.1.0/24"
  tags {
      Name          = "jkmonolith-ecs-subnet-ipv4-az-1b"
  }
}

resource "aws_security_group" "jkmonolith-ecs-security-group" {
  name          = "jkmonolith-ecs-security-group"
  vpc_id        = "${aws_vpc.jkmonolith-ecs-vpc.id}"
  description   = "ECS Security group"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "jkmonolith-ecs-igw" {
  vpc_id   = "${aws_vpc.jkmonolith-ecs-vpc.id}"
  tags {
      Name = "jkmonolith-ecs-igw"
  }
}

resource "aws_route_table" "jkmonolith-ecs-route-table" {
  vpc_id       = "${aws_vpc.jkmonolith-ecs-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.jkmonolith-ecs-igw.id}"
  }
}

resource "aws_route" "jkmonolith-ecs-route-table" {
  route_table_id         = "${aws_route_table.jkmonolith-ecs-route-table.id}"
  gateway_id             = "${aws_internet_gateway.jkmonolith-ecs-igw.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_main_route_table_association" "jkmonolith-ecs-route-table" {
  vpc_id         = "${aws_vpc.jkmonolith-ecs-vpc.id}"
  route_table_id = "${aws_route_table.jkmonolith-ecs-route-table.id}"
}

resource "aws_alb" "jkmonolith-ecs-alb" {
  name                       = "jkmonolith-ecs-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = ["${aws_security_group.jkmonolith-ecs-security-group.id}"]
  subnets                    = ["${aws_subnet.jkmonolith-ecs-subnet-ipv4-az-1a.id}",
                                "${aws_subnet.jkmonolith-ecs-subnet-ipv4-az-1b.id}"]
  enable_deletion_protection = false
  ip_address_type            = "ipv4"

  tags {
      Name                   = "jkmonolith-ecs-alb"
  }
}

resource "aws_alb_target_group" "jkmonolith-targetgroup" {
  vpc_id                = "${aws_vpc.jkmonolith-ecs-vpc.id}"
  port                  = "80"
  protocol              = "HTTP"
  target_type           = "ip"
  health_check {
    healthy_threshold   = "5"
    interval            = "30"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "2"
  }
  stickiness {
    cookie_duration     = "86400"
    enabled             = "false"
    type                = "lb_cookie"
  }
}

resource "aws_alb_listener" "jkmonolith-ecs-alb" {
  load_balancer_arn  = "${aws_alb.jkmonolith-ecs-alb.arn}"
  port               = "80"
  protocol           = "HTTP"
  ssl_policy         = ""

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.jkmonolith-targetgroup.arn}"
  }
}

resource "aws_db_subnet_group" "jkmonolith-ecs-db-subnet-group" {
  name        = "jkmonolith-ecs-db-subnet-group"
  description = "DB subnet group"
  subnet_ids  = ["${aws_subnet.jkmonolith-ecs-subnet-ipv4-az-1a.id}",
                 "${aws_subnet.jkmonolith-ecs-subnet-ipv4-az-1b.id}"]
}

resource "aws_db_instance" "jkmonolith-store-mysql-db" {
  identifier             = "jkmonolith-store-mysql-db"
  skip_final_snapshot    = true
  engine                 = "mysql"
  engine_version         = "5.6.40"
  vpc_security_group_ids = ["${aws_security_group.jkmonolith-ecs-security-group.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.jkmonolith-ecs-db-subnet-group.name}"
  multi_az               =  "true"
  license_model          = "general-public-license"
  allocated_storage      = 20
  instance_class         = "db.t2.small"
  name                   = "store"
  username               = "store"
  password               = "password" #{{.MySQLMasterPassword}}
}

resource "aws_ecs_cluster" "jkmonolith-ecs-cluster" {
  name = "jkmonolith-ecs-cluster"
}

resource "aws_iam_role" "jkmonolith-ecsTaskExecutionRole" {
  name = "jkmonolith-ecsTaskExecutionRole",
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "jkmonolith-ecsTaskExecutionRoleAttachment" {
  role       = "${aws_iam_role.jkmonolith-ecsTaskExecutionRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_service" "jkmonolith-app" {
  cluster                            = "${aws_ecs_cluster.jkmonolith-ecs-cluster.id}"
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
    container_name                   = "jkmonolith-app"
    container_port                   = "8080"
    elb_name                         = ""
    target_group_arn                 = "${aws_alb_target_group.jkmonolith-targetgroup.arn}"
  }
  name                               = "jkmonolith-app"
  network_configuration {
    assign_public_ip                 = "true",
    security_groups                  = ["${aws_security_group.jkmonolith-ecs-security-group.id}"]
    subnets                          = ["${aws_subnet.jkmonolith-ecs-subnet-ipv4-az-1a.id}",
                                        "${aws_subnet.jkmonolith-ecs-subnet-ipv4-az-1b.id}"]
  }
  scheduling_strategy                = "REPLICA",
  task_definition                    = "${aws_ecs_task_definition.jkmonolith-app.arn}"
}

resource "aws_ecs_task_definition" "jkmonolith-app" {
  cpu                      = "2048"
  execution_role_arn       = "${aws_iam_role.jkmonolith-ecsTaskExecutionRole.arn}"
  family                   = "jkmonolith-app"
  memory                   = "4096"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = ""
  container_definitions    = <<-JSON
  [
    {
      "name": "jkmonolith-app",
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
          "value": "jdbc:mysql://${aws_db_instance.jkmonolith-store-mysql-db.address}:${aws_db_instance.jkmonolith-store-mysql-db.port}/store?useUnicode=true&characterEncoding=utf8&useSSL=false"
        },
        {
          "name": "SPRING_DATASOURCE_PASSWORD",
          "value": "password"
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
          "awslogs-region": "eu-west-1",
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