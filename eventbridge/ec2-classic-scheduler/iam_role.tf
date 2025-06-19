resource "aws_iam_role" "ec2_automation_assume_role" {
  name = "Ec2AutomationAssumeRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ssm.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role" "ec2_event_target_role" {
  name = "Ec2EventTargetRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "events.amazonaws.com"
        }
        Condition = {
          StringEquals = {
            "aws:SourceAccount" : "${data.aws_caller_identity.current.account_id}",
            "aws:SourceArn" : [
              "arn:aws:events:${var.ec2_region}:${data.aws_caller_identity.current.account_id}:rule/${aws_cloudwatch_event_rule.schedule_to_start_ec2.name}",
              "arn:aws:events:${var.ec2_region}:${data.aws_caller_identity.current.account_id}:rule/${aws_cloudwatch_event_rule.schedule_to_stop_ec2.name}"
            ]
          }
        }
      }
    ]
  })

  tags = var.tags
}