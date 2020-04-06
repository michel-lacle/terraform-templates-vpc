resource "aws_network_acl" "main-acl" {
  vpc_id = aws_vpc.template-vpc.id

  subnet_ids = [
    aws_subnet.template-public.id]

  # inbound http
  ingress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    rule_no = 100
    to_port = 80
    cidr_block = "0.0.0.0/0"
  }

  # inbound https
  ingress {
    action = "allow"
    from_port = 433
    protocol = "all"
    rule_no = 200
    to_port = 433
    cidr_block = "0.0.0.0/0"
  }

  # inbound ssh
  ingress {
    action = "allow"
    from_port = 22
    protocol = "all"
    rule_no = 200
    to_port = 22
    cidr_block = "0.0.0.0/0"

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