resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-profile-${var.name}"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = "ssm-role-${var.name}"
  path = "/"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}