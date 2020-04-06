resource "aws_network_acl" "public-acl" {
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
  ingress {
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
    Name = "public-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}

# the private subnet is automatically associated with the default acl
# remember that we don't have a route to the private subnet from the outside
resource "aws_default_network_acl" "default-acl" {
  default_network_acl_id = aws_vpc.template-vpc.default_network_acl_id

  ingress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  egress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "default-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}


