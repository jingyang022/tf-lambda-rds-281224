data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["sandbox-vpc"]
  }
}

data "aws_subnets" "db" {
  filter{
    name = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name = "tag:Name"
    values = ["*db-*"]
  }
}