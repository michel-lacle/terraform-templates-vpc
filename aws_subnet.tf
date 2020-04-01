resource "aws_subnet" "template-public" {
  cidr_block = "10.1.1.0/24"
  vpc_id = aws_vpc.template-vpc.id

  availability_zone = "us-east-1a"

  tags = {
    Name = "template-public"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}

resource "aws_subnet" "template-private" {
  cidr_block = "10.1.2.0/24"
  vpc_id = aws_vpc.template-vpc.id

  availability_zone = "us-east-1b"

  tags = {
    Name = "template-private"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}