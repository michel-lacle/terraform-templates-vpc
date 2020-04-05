resource "aws_network_acl" "main-acl" {
  vpc_id = aws_vpc.template-vpc.id

  subnet_ids = [aws_subnet.template-public.id]

  ingress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    rule_no = 100
    to_port = 80
  }

  ingress {
    action = "allow"
    from_port = 443
    protocol = "tcp"
    rule_no = 100
    to_port = 443
  }

  ingress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    rule_no = 100
    to_port = 22
  }

  tags = {
    Name = "main-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}