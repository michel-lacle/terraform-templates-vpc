resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.template-vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.template-internet-gateway.id
  }

  tags = {
    Name = "public-route-table"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}