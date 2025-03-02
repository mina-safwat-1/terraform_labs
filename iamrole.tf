resource "aws_iam_role" "lambda-s3-ses-role" {
  name = "lambda_role_cloudwatch_sts_s3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy_attachment" "attach_ses_full" {
  role       = aws_iam_role.lambda-s3-ses-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}

resource "aws_iam_role_policy_attachment" "attach_s3_cloudwatch" {
  role       = aws_iam_role.lambda-s3-ses-role.name
  policy_arn = aws_iam_policy.cloudwatch_s3_policy_lambda.arn
}
