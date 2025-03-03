# S3 Event Trigger for Lambda
resource "aws_s3_bucket_notification" "s3_trigger" {
  bucket = "terraform-state-bucket-mina-123" # Replace with your bucket name

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambdaterraform_s3_ses.arn
    events              = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Post"] # Only trigger on PUT & POST
  }

  depends_on = [aws_lambda_permission.allow_s3_invoke]
}

# Allow S3 to Invoke Lambda
resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowS3InvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambdaterraform_s3_ses.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::terraform-state-bucket-mina-123"
}
