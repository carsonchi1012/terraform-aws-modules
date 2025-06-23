resource "aws_iam_role" "sagemaker_ai_scheduler_role" {
  name = "SagemakerAiSchedulerRole-${var.scheduler_name}"

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