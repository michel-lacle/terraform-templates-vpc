resource "aws_vpc" "template-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-templates-vpc"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}
