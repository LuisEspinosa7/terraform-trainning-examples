##########################
# Lambda definition ######
##########################

# Data resource to archive Lambda function code
data "archive_file" "lambda_zip" {
    source_dir  = "${path.module}/lambda/"
    output_path = "${path.module}/lambda.zip"
    type        = "zip"
}


# Lambda function declaration
resource "aws_lambda_function" "lambda_processor" {
    filename = data.archive_file.lambda_zip.output_path
    source_code_hash = data.archive_file.lambda_zip.output_base64sha256
    function_name = "${var.app_env}-lambda"
    role = aws_iam_role.iam_for_terraform_lambda.arn
    handler = "index.handler"
    runtime = "python3.8"

    environment {
      variables = {
        SOURCE_EMAIL = "lluisllanoss@gmail.com",
        DEST_EMAIL = "lluisllanoss@gmail.com"
      }
    }
}