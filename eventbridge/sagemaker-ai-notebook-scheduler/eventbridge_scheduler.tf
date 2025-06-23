resource "aws_scheduler_schedule" "schedule_to_start_notebook" {
  name                = "ScheduleToStartNotebook-${var.scheduler_name}"
  description         = "Starts the specified SageMaker AI notebook"
  schedule_expression = var.schedule_notebook_start_time

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:sagemaker:startNotebookInstance"
    role_arn = aws_iam_role.sagemaker_ai_scheduler_role.arn
    input = jsonencode({
      NotebookInstanceName = var.notebook_id
    })
  }
}

resource "aws_scheduler_schedule" "schedule_to_stop_notebook" {
  name                = "ScheduleToStopNotebook-${var.scheduler_name}"
  description         = "Stops the specified SageMaker AI notebook"
  schedule_expression = var.schedule_notebook_stop_time

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:sagemaker:stopNotebookInstance"
    role_arn = aws_iam_role.sagemaker_ai_scheduler_role.arn
    input = jsonencode({
      NotebookInstanceName = var.notebook_id
    })
  }
}