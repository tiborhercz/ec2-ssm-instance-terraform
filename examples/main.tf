module "ec2-instance" {
  source = "git@github.com:tiborhercz/ec2-ssm-ping-test-instance-terraform.git"

  name           = "SSM session example instance"
  vpc_id         = "VPC_ID"
  vpc_subnet_id  = "VPC_SUBNET_ID"

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
