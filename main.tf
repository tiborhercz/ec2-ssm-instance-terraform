data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "test" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t3.micro"

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.id
  vpc_security_group_ids = [aws_security_group.ping.id]
  subnet_id = var.vpc_subnet_id

  tags = {
    Name = "Test instance"
  }
}

resource "aws_security_group" "ping" {
  name        = "ping"
  description = "Allow ping"
  vpc_id      = var.vpc_id

  ingress {
    description      = "icmp from VPC"
    from_port        = 8
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TCP from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}