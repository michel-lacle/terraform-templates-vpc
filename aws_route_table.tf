resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.template-vpc.id

  # default routes are created by implicitly, so we don't have to
  # specify them. example: 10.0.0.0/16(destination) --> local(target)

  # route all external traffic through the internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.template-internet-gateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.template-internet-gateway.id
  }

  tags = {
    Name = "public-route-table"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}

# we link our public route table to our public subnet
resource "aws_route_table_association" "public_route_table_association" {

  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.template-public.id
}

# add a route for traffic to the internet through the NAT gateway
# this way our private subnet can access the internet
resource "aws_default_route_table" "default-route-table" {
  default_route_table_id = aws_vpc.template-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "main-route-table"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}