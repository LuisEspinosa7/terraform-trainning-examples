##########################
# Event Bridge  ##########
##########################

# Lambda function role
resource "aws_cloudwatch_event_rule" "unused_eips" {
    name = "${var.app_env}-event-rule"
    description = "event"
    schedule_expression = "rate(1 minute)"
}
# Select lambda as target
resource "aws_cloudwatch_event_target" "unused_eips" {
    rule = aws_cloudwatch_event_rule.unused_eips.name
    target_id = "SendUnusedEIPs"
    arn = aws_lambda_function.lambda_processor.arn
}

# Allow cloudwatch to invoke lambda function
resource "aws_lambda_permission" "allow_cloudwatch" {
    statement_id = "AllowExecutionFromCloudwatch"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.lambda_processor.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.unused_eips.arn
}
