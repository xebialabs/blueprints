output "address" {
  value = "${aws_alb.ecs-alb.dns_name}"
}
output "mysql_address" {
  value = "${aws_db_instance.store-mysql-db.address}"
}
output "mysql_port" {
  value = "${aws_db_instance.store-mysql-db.port}"
}