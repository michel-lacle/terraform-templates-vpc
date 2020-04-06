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
    protocol = "tcp"
    rule_no = 200
    to_port = 433
    cidr_block = "0.0.0.0/0"
  }

  # inbound ssh
  ingress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    rule_no = 300
    to_port = 22
    cidr_block = "0.0.0.0/0"
  }

  # inbound ephemeral
  igress {
    action = "allow"
    from_port = 1024
    protocol = "tcp"
    rule_no = 400
    to_port = 65335
    cidr_block = "0.0.0.0/0"
  }


  # outbound http
  egress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    rule_no = 100
    to_port = 80
    cidr_block = "0.0.0.0/0"
  }

  # outbound https
  egress {
    action = "allow"
    from_port = 433
    protocol = "tcp"
    rule_no = 200
    to_port = 433
    cidr_block = "0.0.0.0/0"
  }

  # outbound ssh
  egress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    rule_no = 300
    to_port = 22
    cidr_block = "0.0.0.0/0"
  }

  # outbound ephemeral
  egress {
    action = "allow"
    from_port = 1024
    protocol = "tcp"
    rule_no = 400
    to_port = 65335
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "main-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}