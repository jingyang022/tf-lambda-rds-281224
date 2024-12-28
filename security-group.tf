resource "aws_security_group" "allow_Lambda-RDS" {
  name        = "yap-moviesdb-api-sg"
  description = "Allow Lambda function to access RDS"
  vpc_id      = data.aws_vpc.selected.id

  egress {
   #description = "HTTPS egress"
   from_port   = 3306
   to_port     = 3306
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

  tags = {
    Name = "yap-moviesdb-api-sg"
  }
}