resource "aws_internet_gateway" "template-internet-gateway" {

  vpc_id = aws_vpc.template-vpc.id


  tags = {
    Name = "templates-vpc"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}