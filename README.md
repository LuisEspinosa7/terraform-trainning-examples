# terraform-trainning-examples

This repository contains several example implementations of infraestructure as code in terraform. This is part of my personal 
trainning as well as my portfolio.

## Requisites
1. Install Terraform
2. Create and AWS Account
3. Create an AWS User with Admin priviledges.


## Installation of each project

### Step 1
1. Init and download provider
```
$ terraform init
```

### Step 2
2. Provision the resources
```
$ terraform apply
```

### Step 3
3. Destroy
```
$ terraform destroy
```

## Examples

| Name    | Description |
|---------|-------------|
| [basic-ec2-instance](https://github.com/LuisEspinosa7/terraform-trainning-examples/tree/main/1.simple-ec2) | Basic EC2 instance |
| [vpc-2subnets-igw](https://github.com/LuisEspinosa7/terraform-trainning-examples/tree/main/2.vpc-2subnets-igw) | 1 VPC with 2 public subnets and 1 IGW|
| [vpc-private-subnet-nat](https://github.com/LuisEspinosa7/terraform-trainning-examples/tree/main/3.vpc-private-subnet-nat) | 1 VPC, 1 public subnet (1 EC2), 1 private subnet (1 EC2), 1 IGW and 1 NAT GW |
| [dynamo-rds-s3](https://github.com/LuisEspinosa7/terraform-trainning-examples/tree/main/4.dynamo-rds-s3) | 1 dynamo DB, 1 MySQL RDS DB and 1 s3 bucket. |
| [lambda-apigw-zip](https://github.com/LuisEspinosa7/terraform-trainning-examples/tree/main/5.lambda-apigw-zip) | 1 lambda integrated with api gateway packaged in a zip. |
| [lambda-s3-auto-zip](https://github.com/LuisEspinosa7/terraform-trainning-examples/tree/main/6.lambda-s3-auto-zip) | 1 lambda integrated with api gateway and s3, the lambda is automatically packaged in a zip and with every change terraform will redeploy. |
| [lambda-s3-read](https://github.com/LuisEspinosa7/terraform-trainning-examples/tree/main/7.lambda-s3-read) | 1 lambda which reads a file from s3. |
