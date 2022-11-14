variable "instance_profile_name" {
  description = "Instance profile name"
  type        = string
  default     = "ssm_instance_profile"
}

variable "ssm_role_name" {
  description = "Role name for the instance profile"
  type        = string
  default     = "ssm_instance_profile_role"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "Test instance"
}

variable "instance_size" {
  description = "Size of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ec2_subnet_id" {
  description = "Subnet ID to deploy the EC2 instance in"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group attached to the EC2 instance"
  type        = string
  default     = "ec2-ssm-instance-security-group"
}

variable "security_group_ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}
