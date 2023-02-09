variable "myregion" {
    description = "aws region"
    type = string
    default = "us-east-1"
}


variable "accountId" {
    description = "aws account id"
    type = string
}


variable "lambda_function_name" {
    description = "Lambda function name"
    type = string
    default = "Hello_Lambda_Terraform"
}

variable "endpoint_path" {
    description = "The GET endpoint path"
    type = string
    default = "hello"
}