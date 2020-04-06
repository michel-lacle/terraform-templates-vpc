resource "aws_network_acl" "main-acl" {
  vpc_id = aws_vpc.template-vpc.id

  # subnet_ids = [
  #   aws_subnet.template-public.id]

  ingress {
    action = "allow"
    from_port = 0
    protocol = "all"
    rule_no = 100
    to_port = 0
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    action = "allow"
    from_port = 0
    protocol = "all"
    rule_no = 200
    to_port = 0
    ipv6_cidr_block = "::/0"
  }

  egress {
    action = "allow"
    from_port = 0
    protocol = "all"
    rule_no = 100
    to_port = 0
    cidr_block = "0.0.0.0/0"
  }

  egress {
    action = "allow"
    from_port = 0
    protocol = "all"
    rule_no = 200
    to_port = 0
    ipv6_cidr_block = "::/0"
  }

  tags = {
    Name = "main-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}