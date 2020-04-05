resource "aws_network_acl" "main-acl" {
  vpc_id = aws_vpc.template-vpc.id

 # subnet_ids = [
 #   aws_subnet.template-public.id]

  ingress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    rule_no = 100
    to_port = 80
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    action = "allow"
    from_port = 443
    protocol = "tcp"
    rule_no = 200
    to_port = 443
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    rule_no = 300
    to_port = 22
    cidr_block = "0.0.0.0/0"
  }

  egress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    rule_no = 100
    to_port = 80
    cidr_block = "0.0.0.0/0"
  }

    egress {
    action = "allow"
    from_port = 443
    protocol = "tcp"
    rule_no = 200
    to_port = 443
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "main-acl"
    Owner = "terraform-templates-vpc"
    Project = "terraform-templates-vpc"
  }
}