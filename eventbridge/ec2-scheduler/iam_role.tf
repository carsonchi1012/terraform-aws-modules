resource "aws_iam_role" "ec2_scheduler_role" {
  name = "Ec2SchedulerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "scheduler.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}