output "start_schedule_name" {
  description = "The name of the EC2 start scheduler"
  value       = aws_scheduler_schedule.schedule_to_start_ec2.name
}

output "stop_schedule_name" {
  description = "The name of the EC2 stop scheduler"
  value       = aws_scheduler_schedule.schedule_to_stop_ec2.name
}

output "ec2_scheduler_role_arn" {
  description = "The ARN of the IAM role used by the scheduler"
  value       = aws_iam_role.ec2_scheduler_role.arn
}

output "ec2_scheduler_role_policy_id" {
  description = "The ID of the IAM policy attached to the role"
  value       = aws_iam_role_policy.ec2_scheduler_role_policy.id
}