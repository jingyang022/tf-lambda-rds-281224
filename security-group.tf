resource "aws_security_group" "allow_Lambda-RDS" {
  name        = "yap-moviesdb-api-sg"
  description = "Allow Lambda function to access RDS"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "yap-moviesdb-api-sg"
  }
}