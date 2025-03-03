resource "aws_iam_policy" "cloudwatch_s3_policy_lambda" {
  name        = "cloudwatch_s3_policy_lambda"
  path        = "/"
  description = "policy to allow lambda function to access specific s3 bucket and put its logs in cloudwatch"

  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "S3Access",
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource" : [
          "arn:aws:s3:::terraform-state-bucket-mina-123",
          "arn:aws:s3:::terraform-state-bucket-mina-123/*"
        ]
      }

    ]


  })
}

