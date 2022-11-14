# EC2 SSM instance

This module deploys an EC2 instance with an attached IAM instance profile.
This instance profile allows has the `arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore` attached to allows for EC2 SSM sessions.
