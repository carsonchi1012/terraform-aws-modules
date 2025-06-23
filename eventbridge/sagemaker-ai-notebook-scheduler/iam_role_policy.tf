resource "aws_iam_role_policy" "sagemaker_ai_scheduler_role_policy" {
  name = "sagemaker-ai-scheduler-role-policy-${var.scheduler_name}"
  role = aws_iam_role.sagemaker_ai_scheduler_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "sagemaker:StartNotebookInstance",
          "sagemaker:StopNotebookInstance"
        ]
        Effect   = "Allow",
        Resource = "arn:aws:sagemaker:${data.aws_region.current.id}:${data.aws_caller_identity.current.account_id}:notebook-instance/${var.notebook_id}"
      }
    ]
  })
}