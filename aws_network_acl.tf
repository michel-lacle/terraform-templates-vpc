resource "aws_network_acl" "main-acl" {
  vpc_id = aws_vpc.template-vpc.id



  tags = {
    Name = "main-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}