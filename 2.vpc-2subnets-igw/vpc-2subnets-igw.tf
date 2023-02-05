# Provider
provider "aws" {
  region     = "us-east-1"
  profile    = "terraform"
}

######################
# EXAMPLE: DEV ENV ###
######################

# Creating VPC
resource "aws_vpc" "dev" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "dev"
  }
}

# Creating Public Subnets in VPC
resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public-1"
  }
}

resource "aws_subnet" "dev-public-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "dev-public-2"
  }
}

# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev"
  }
}

# Creating Route Tables for Internet gateway
resource "aws_route_table" "dev-public" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }

  tags = {
    Name = "dev-public-1"
  }
}

# Creating Route Associations public subnets
resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id      = aws_subnet.dev-public-1.id
  route_table_id = aws_route_table.dev-public.id # IGW Route table
}

resource "aws_route_table_association" "dev-public-2-a" {
  subnet_id      = aws_subnet.dev-public-2.id
  route_table_id = aws_route_table.dev-public.id # IGW Route table
}

# Creating Security Group
resource "aws_security_group" "dev_public-sg" {
  name        = "public_sg"
  description = "security group for public"
  vpc_id = aws_vpc.dev.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags= {
    Name = "dev-public-sg"
  }
}

# -------------------------------------------------
# 1. FIRST WAY FOR KEY PAIR CREATION 
# ATTENTION: Create first an RSA key pairs in your local
# ssh-keygen -b 4096 -t rsa
# In my case I called them (terraform)

# Creating Key Pair Keys
resource "aws_key_pair" "terraform_keys" {
  key_name = "terraform"
  public_key = file("~/.ssh/terraform.pub")
}

# 2. SECOND WAY FOR KEY PAIR CREATION (AUTOMATIC)
# resource "aws_key_pair" "terraform_keys" {
#   key_name   = "terraform"
#   public_key = tls_private_key.rsa.public_key_openssh
# }

# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "local_file" "terraform_keys" {
#     content  = tls_private_key.rsa.private_key_pem
#     filename = "terraform"
# }

# -------------------------------------------------

# Creating EC2 instances in public subnets
resource "aws_instance" "public_inst_1" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.dev-public-1.id}"
  key_name = "terraform"
  # security_groups= [aws_security_group.dev_public-sg.name]
  vpc_security_group_ids = [aws_security_group.dev_public-sg.id]
  tags = {
    Name = "public_inst_1"
  }

  user_data = <<EOF
		#!/bin/bash
		yum update -y
		yum install -y httpd.x86_64
		systemctl start httpd.service
		systemctl enable httpd.service
		echo "Hello World (1) from $(hostname -f)" > /var/www/html/index.html
	EOF

  depends_on = [
    aws_key_pair.terraform_keys
  ]
}

resource "aws_instance" "public_inst_2" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.dev-public-2.id}"
  key_name = "terraform"
  vpc_security_group_ids = [aws_security_group.dev_public-sg.id]
  tags = {
    Name = "public_inst_2"
  }

  user_data = <<EOF
		#!/bin/bash
		yum update -y
		yum install -y httpd.x86_64
		systemctl start httpd.service
		systemctl enable httpd.service
		echo "Hello World (2) from $(hostname -f)" > /var/www/html/index.html
	EOF

  depends_on = [
    aws_key_pair.terraform_keys
  ]
}