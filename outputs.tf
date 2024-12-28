data "aws_vpc" "default" {
  id = aws_vpc.default.vpc_id
}

output "vpc_id" {
    value = data.aws_vpc.default.id
}