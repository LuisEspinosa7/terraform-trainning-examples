##########################
# Infra variables ########
##########################

variable "region" {
    default = "us-east-1"
    description = "AWS Region to deploy in"
}

variable "app_env" {
    default = "s3filedev"
    description = "Common prefix for all Terraform created resources"
}