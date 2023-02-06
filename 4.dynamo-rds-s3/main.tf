# Provider
provider "aws" {
  region     = "us-east-1"
  profile    = "terraform"
}

############################
# DYNAMO DB TABLE ##########
############################

resource "aws_dynamodb_table" "employees_table" {
  name = "employeesTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "employeeid"
  
  attribute {
    name = "employeeid"
    type = "S"
  }

  tags = {
    environment = "test_dev"
  }
}

output "dynamo_arn" {
  value = aws_dynamodb_table.employees_table.arn
  description = "Dynamo DB arn"
}

############################
# RDS TABLE ################
############################
resource "aws_db_instance" "myrdsMySQL" {
   allocated_storage   = 20
   storage_type        = "gp2"
   identifier          = "rdstf"
   engine              = "mysql"
   engine_version      = "8.0.27"
   instance_class      = "db.t2.micro"
   username            = "admin"
   password            = "Passw0rd!123"
   publicly_accessible = true
   skip_final_snapshot = true

   tags = {
     Name = "MyRDS"
   }
 }




############################
# S3 BUCKET ################
############################

resource "aws_s3_bucket" "terrabucket1" {
  bucket = "my-tf-bucket756482011"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}





