output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "db_subnet_ids" {
    value = data.aws_subnets.db.ids
}