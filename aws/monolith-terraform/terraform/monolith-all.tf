provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

resource "aws_vpc" "ecs-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"
  tags {
      Name             = "${var.app_name}-ecs-vpc"
  }
}

resource "aws_subnet" "ecs-subnet-ipv4-az-1a" {
  availability_zone = "${var.region}a"
  vpc_id            = "${aws_vpc.ecs-vpc.id}"
  cidr_block        = "10.0.0.0/24"
  tags {
      Name          = "${var.app_name}-ecs-subnet-ipv4-az-1a"
  }
}

resource "aws_subnet" "ecs-subnet-ipv4-az-1b" {
  availability_zone = "${var.region}b"
  vpc_id            = "${aws_vpc.ecs-vpc.id}"
  cidr_block        = "10.0.1.0/24"
  tags {
      Name          = "${var.app_name}-ecs-subnet-ipv4-az-1b"
  }
}

resource "aws_security_group" "ecs-security-group" {
  name          = "${var.app_name}-ecs-security-group"
  vpc_id        = "${aws_vpc.ecs-vpc.id}"
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

resource "aws_internet_gateway" "ecs-igw" {
  vpc_id   = "${aws_vpc.ecs-vpc.id}"
  tags {
      Name = "${var.app_name}-ecs-igw"
  }
}

resource "aws_route_table" "ecs-route-table" {
  vpc_id       = "${aws_vpc.ecs-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ecs-igw.id}"
  }
  tags {
    Name                   = "${var.app_name}-ecs-route-table"
  }
}

resource "aws_route" "ecs-route" {
  route_table_id         = "${aws_route_table.ecs-route-table.id}"
  gateway_id             = "${aws_internet_gateway.ecs-igw.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_main_route_table_association" "ecs-route-table-association" {
  vpc_id         = "${aws_vpc.ecs-vpc.id}"
  route_table_id = "${aws_route_table.ecs-route-table.id}"
}

resource "aws_alb" "ecs-alb" {
  name                       = "${var.app_name}-ecs-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = ["${aws_security_group.ecs-security-group.id}"]
  subnets                    = ["${aws_subnet.ecs-subnet-ipv4-az-1a.id}",
                                "${aws_subnet.ecs-subnet-ipv4-az-1b.id}"]
  enable_deletion_protection = false
  ip_address_type            = "ipv4"

  tags {
      Name                   = "${var.app_name}-ecs-alb"
  }
}

resource "aws_alb_target_group" "ecs-alb-target-group" {
  vpc_id                = "${aws_vpc.ecs-vpc.id}"
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
  tags {
    Name                   = "${var.app_name}-ecs-alb-target-group"
  }
}

resource "aws_alb_listener" "ecs-alb-listener" {
  load_balancer_arn  = "${aws_alb.ecs-alb.arn}"
  port               = "80"
  protocol           = "HTTP"
  ssl_policy         = ""
  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.ecs-alb-target-group.arn}"
  }
}

resource "aws_db_subnet_group" "ecs-db-subnet-group" {
  name        = "${var.app_name}-ecs-db-subnet-group"
  description = "DB subnet group"
  subnet_ids  = ["${aws_subnet.ecs-subnet-ipv4-az-1a.id}",
                 "${aws_subnet.ecs-subnet-ipv4-az-1b.id}"]
}

resource "aws_db_instance" "store-mysql-db" {
  identifier             = "${var.app_name}-store-mysql-db"
  skip_final_snapshot    = true
  engine                 = "mysql"
  engine_version         = "5.6.40"
  vpc_security_group_ids = ["${aws_security_group.ecs-security-group.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.ecs-db-subnet-group.name}"
  multi_az               =  "true"
  license_model          = "general-public-license"
  allocated_storage      = 20
  instance_class         = "db.t2.small"
  name                   = "store"
  username               = "store"
  password               = "password" #{{.MySQLMasterPassword}}
}

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.app_name}-ecs-cluster"
}

resource "aws_iam_role" "ecs-task-execution-role" {
  name = "${var.app_name}-ecs-task-execution-role",
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

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-attachment" {
  role       = "${aws_iam_role.ecs-task-execution-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_service" "ecs-service" {
  name                               = "${var.app_name}-ecs-service"
  cluster                            = "${aws_ecs_cluster.ecs-cluster.id}"
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
    target_group_arn                 = "${aws_alb_target_group.ecs-alb-target-group.arn}"
  }
  network_configuration {
    assign_public_ip                 = "true",
    security_groups                  = ["${aws_security_group.ecs-security-group.id}"]
    subnets                          = ["${aws_subnet.ecs-subnet-ipv4-az-1a.id}",
                                        "${aws_subnet.ecs-subnet-ipv4-az-1b.id}"]
  }
  scheduling_strategy                = "REPLICA",
  task_definition                    = "${aws_ecs_task_definition.ecs-task-definition.arn}"
}

resource "aws_ecs_task_definition" "ecs-task-definition" {
  tags {
    Name                   = "${var.app_name}-ecs-task-definition"
  }
  cpu                      = "2048"
  execution_role_arn       = "${aws_iam_role.ecs-task-execution-role.arn}"
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
          "value": "jdbc:mysql://${aws_db_instance.store-mysql-db.address}:${aws_db_instance.store-mysql-db.port}/store?useUnicode=true&characterEncoding=utf8&useSSL=false"
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