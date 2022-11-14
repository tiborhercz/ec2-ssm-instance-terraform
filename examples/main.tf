module "ec2-instance" {
  source = "../"

  name          = "SSM session example instance"
  vpc_id        = "VPC_ID"
  ec2_subnet_id = "SUBNET_ID"

  security_group_ingress_with_cidr_blocks = [
    {
      from_port   = 8
      to_port     = -1
      protocol    = "icmp"
      description = "icmp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "tcp"
      cidr_blocks = "VPC_CIDR_RANGE"
    },
  ]
}
