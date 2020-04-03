resource "aws_vpc" "template-vpc" {
  cidr_block = "10.0.0.0/16"

  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "template-vpc"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}
