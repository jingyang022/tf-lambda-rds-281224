data "aws_iam_policy" "lambda_full_access" {
  name = "AWSLambda_FullAccess"
}

resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name = "lambda_policy_attachment"
  roles = aws_iam_role.lambda_exec_role.name
  policy_arn = data.aws_iam_policy.lambda_full_access.arn
}

resource "aws_iam_role" "lambda_exec_role" {
 name = "lambda_execution_role"
  assume_role_policy = jsonencode({
   Version = "2012-10-17",
   Statement = [
     {
       Action = "sts:AssumeRole",
       Principal = {
         Service = "lambda.amazonaws.com"
       },
       Effect = "Allow"
     }
   ]
 })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
 role       = aws_iam_role.lambda_exec_role.name
 policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

/* resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket.arn
} */