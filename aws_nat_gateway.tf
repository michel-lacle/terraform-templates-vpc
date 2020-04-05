resource "aws_eip" "nat-elastic-ip" {
  vpc = true

  depends_on                = ["aws_internet_gateway.template-internet-gateway"]
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat-elastic-ip.id
  subnet_id = aws_subnet.template-public

  tags = {
    Name = "template-nat-gateway"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}
