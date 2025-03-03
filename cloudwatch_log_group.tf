# Create CloudWatch Log Group
resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/lambda_s3_ses"
  retention_in_days = 7
}


