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
  instance_type = var.instance_size

  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.id
  vpc_security_group_ids = [aws_security_group.ping.id]
  subnet_id              = var.ec2_subnet_id

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "ping" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
  count = length(var.security_group_ingress_with_cidr_blocks) > 0 ? length(var.security_group_ingress_with_cidr_blocks) : 0

  security_group_id = aws_security_group.ping.id
  type              = "ingress"

  cidr_blocks = split(
    ",",
    lookup(
      var.security_group_ingress_with_cidr_blocks[count.index],
      "cidr_blocks",
    ),
  )
  description = lookup(
    var.security_group_ingress_with_cidr_blocks[count.index],
    "description",
    "Ingress Rule",
  )

  from_port = lookup(
    var.security_group_ingress_with_cidr_blocks[count.index],
    "from_port",
  )
  to_port = lookup(
    var.security_group_ingress_with_cidr_blocks[count.index],
    "to_port",
  )
  protocol = lookup(
    var.security_group_ingress_with_cidr_blocks[count.index],
    "protocol",
  )
}
