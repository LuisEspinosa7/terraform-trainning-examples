##########################
# Infra variables ########
##########################

variable "region" {
    default = "us-east-1"
    description = "AWS Region to deploy in"
}

variable "app_env" {
    default = "eipdev"
    description = "Common prefix for all Terraform created resources"
}