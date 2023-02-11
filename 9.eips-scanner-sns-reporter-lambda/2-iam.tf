##########################
# IAM definition #########
##########################


# Lambda function policy for (SES - EC2 - CloudWatch)
resource "aws_iam_policy" "lambda_policy" {
    name        = "${var.app_env}-lambda-policy"
    description = "${var.app_env}-lambda-policy"
 
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ses:SendEmail"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "ec2:DescribeAddresses"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


# Lambda function role
resource "aws_iam_role" "iam_for_terraform_lambda" {
    name = "${var.app_env}-lambda-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Role to Policy attachment
resource "aws_iam_role_policy_attachment" "terraform_lambda_iam_policy_basic_execution" {
    role = aws_iam_role.iam_for_terraform_lambda.id
    policy_arn = aws_iam_policy.lambda_policy.arn
}
