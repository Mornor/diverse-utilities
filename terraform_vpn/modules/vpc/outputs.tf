output "main_vpc_id" {
  value = aws_vpc.main.id
}

output "route_table_id" {
  value = aws_vpc.main.main_route_table_id
}