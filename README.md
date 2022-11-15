# EC2 SSM instance

This module deploys an EC2 instance with an attached IAM instance profile.
This instance profile allows has the `arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore` attached to allows for EC2 SSM sessions.

## Requirements:
The EC2 instances need to be able to access the endpoints listed below.
This can either be done through VPC endpoints or through a NAT gateway.

- ec2messages.region.amazonaws.com
- ssm.region.amazonaws.com
- ssmmessages.region.amazonaws.com

See more information here:
https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-prerequisites.html

