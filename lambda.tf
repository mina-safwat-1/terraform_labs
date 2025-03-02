# Package Lambda Function Code (Fix source_file to Python)
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.py"  # Use the correct Python file
  output_path = "lambda_function_payload.zip"
}

# Define the Lambda function
resource "aws_lambda_function" "lambdaterraform_s3_ses" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.lambda-s3-ses-role.arn
  handler       = "lambda.lambda_handler"  # Corrected to Python format
  runtime       = "python3.9"  # Updated to Python
  timeout = 60
  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
      foo = "bar"
    }
  }
}
