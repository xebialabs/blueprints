output "address" {
  value = "${aws_alb.ecs-alb.dns_name}"
}