# Creating Elastic IP
resource "aws_eip" "nat" {
  vpc = true
  depends_on = [
    aws_internet_gateway.dev-gw
  ]
  tags = {
    Name = "NAT Gateway EIP"
  }
}

# Creating Nat Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.dev-public-1.id
}

# Add routes for VPC
resource "aws_route_table" "dev-private" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Creating route associations for private Subnets
resource "aws_route_table_association" "dev-private-1-a" {
  subnet_id      = aws_subnet.dev-private-1.id
  route_table_id = aws_route_table.dev-private.id
}