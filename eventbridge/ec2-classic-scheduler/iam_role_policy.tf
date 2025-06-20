resource "aws_iam_role_policy" "ec2_automation_assume_role_policy" {
  name = "ec2-automation-assume-role-policy"
  role = aws_iam_role.ec2_automation_assume_role.id

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

resource "aws_iam_role_policy" "ec2_event_target_role_policy" {
  name = "ec2-event-target-role-policy"
  role = aws_iam_role.ec2_event_target_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "ssm:StartAutomationExecution",
        Effect = "Allow",
        Resource = [
          "arn:aws:ssm:${var.ec2_region}:*:automation-definition/AWS-StopEC2Instance:*",
          "arn:aws:ssm:${var.ec2_region}:*:automation-definition/AWS-StartEC2Instance:*"
        ]
      },
      {
        Sid      = "AllowPassRole",
        Effect   = "Allow",
        Action   = "iam:PassRole",
        Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.ec2_automation_assume_role.name}",
        Condition = {
          StringLikeIfExists = {
            "iam:PassedToService" : "ssm.amazonaws.com"
          }
        }
      }
    ]
  })
}