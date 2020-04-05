resource "aws_network_acl" "main-acl" {
  vpc_id = aws_vpc.template-vpc.id

  subnet_id = aws_subnet.template-public.id

/*  ingress {
    action = ""
    from_port = 0
    protocol = ""
    rule_no = 0
    to_port = 0
  }*/

  tags = {
    Name = "main-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}