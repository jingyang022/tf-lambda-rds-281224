output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "db_subnet_ids" {
    value = data.aws_subnets.db.ids
}

output "rds_sg_id" {
    value = data.aws_security_group.rds_sg.id
}