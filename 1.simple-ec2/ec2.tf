provider "aws" {
  region     = "us-east-1"
  profile    = "terraform"
}

resource "aws_instance" "simple-ec2" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
}