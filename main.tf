#############################################################
# Lambda Function
#############################################################

# Define an archive_file datasource that creates the lambda archive
data "archive_file" "lambda" {
 type        = "zip"
 #source_file = "hello.py"
 source_dir  = "./package"
 output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "func" {
 function_name = "yap-moviesdb-api"
 role          = aws_iam_role.lambda_exec_role.arn
 handler       = "lambda_function.lambda_handler"
 runtime       = "python3.8"
 filename      = data.archive_file.lambda.output_path

# VPC Configuration
 vpc_config {
    # Choose all the db subnets same as RDS
    subnet_ids         = data.aws_subnets.db.ids
    security_group_ids = [aws_security_group.allow_Lambda-RDS.id]
  }

  # Environment Variables
  environment {
    variables = {
       	DB_NAME = "sandboxdb",
        USERNAME = "admin",
        PASSWORD = "",  # get password from Secrets Manager
        RDS_ENDPOINT = "sandbox-rds.cnge2fzfx0rs.ap-southeast-1.rds.amazonaws.com"
    }
  }
}

# aws_cloudwatch_log_group to get the logs of the Lambda execution.
resource "aws_cloudwatch_log_group" "lambda_log_group" {
 name              = "/aws/lambda/yap-moviesdb-api"
 retention_in_days = 14
}