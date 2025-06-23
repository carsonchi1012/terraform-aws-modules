output "sagemaker_ai_scheduler_role_arn" {
  description = "IAM role ARN used by the scheduler to start/stop the SageMaker SageMaker AI notebook"
  value       = aws_iam_role.sagemaker_ai_scheduler_role.arn
}

output "start_schedule_name" {
  description = "Name of the AWS Scheduler schedule for starting the SageMaker AI notebook"
  value       = aws_scheduler_schedule.schedule_to_start_notebook.name
}

output "stop_schedule_name" {
  description = "Name of the AWS Scheduler schedule for stopping the SageMaker AI notebook"
  value       = aws_scheduler_schedule.schedule_to_stop_notebook.name
}

output "notebook_instance_arn" {
  description = "ARN of the SageMaker AI notebook instance"
  value       = "arn:aws:sagemaker:${data.aws_region.current.id}:${data.aws_caller_identity.current.account_id}:notebook-instance/${var.notebook_id}"
}