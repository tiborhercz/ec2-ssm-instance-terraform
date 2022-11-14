variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_subnet_id" {
  type = string
}

variable "security_group_ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}
