data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["sandbox-vpc"]
  }
}

output "vpc_id" {
  value = data.aws_vpc.selected.id
}