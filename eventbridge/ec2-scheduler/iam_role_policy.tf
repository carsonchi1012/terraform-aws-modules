resource "aws_iam_role_policy" "ec2_scheduler_role_policy" {
  name = "ec2-scheduler-role-policy"
  role = aws_iam_role.ec2_scheduler_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
    {
      Action = [
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      Effect   = "Allow",
      Resource = "arn:aws:ec2:${data.aws_region.current.id}:${data.aws_caller_identity.current.account_id}:instance/${var.ec2_id}"
    },
    {
      Action = "ec2:DescribeInstances",
      Effect = "Allow",
      Resource = "*"
    }
  ]
  })
}