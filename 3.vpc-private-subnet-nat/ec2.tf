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
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags= {
    Name = "dev-public-sg"
  }
}


# ATTENTION: Create first an RSA key pairs in your local
# ssh-keygen -b 4096 -t rsa
# In my case I called them (terraform)

# Creating Key Pair Keys
resource "aws_key_pair" "terraform_keys" {
  key_name = "terraform"
  public_key = file("~/.ssh/terraform.pub")
}


# Creating EC2 instances in public subnets
resource "aws_instance" "public_inst_1" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.dev_public-sg.id]
  subnet_id = "${aws_subnet.dev-public-1.id}"
  key_name = "terraform"
  count = 1
  associate_public_ip_address = true
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

resource "aws_instance" "private_inst_1" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.dev_public-sg.id]
  subnet_id = "${aws_subnet.dev-private-1.id}"
  key_name = "terraform"
  count = 1
  associate_public_ip_address = false
  tags = {
    Name = "private_inst_1"
  }

  depends_on = [
    aws_key_pair.terraform_keys
  ]
}