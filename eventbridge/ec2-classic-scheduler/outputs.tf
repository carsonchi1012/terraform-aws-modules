output "start_rule_name" {
  description = "Name of the EventBridge rule that starts the EC2 instance"
  value       = aws_cloudwatch_event_rule.schedule_to_start_ec2.name
}

output "stop_rule_name" {
  description = "Name of the EventBridge rule that stops the EC2 instance"
  value       = aws_cloudwatch_event_rule.schedule_to_stop_ec2.name
}

output "event_target_role_arn" {
  description = "ARN of the IAM role used by EventBridge to start automation"
  value       = aws_iam_role.ec2_event_target_role.arn
}

output "automation_assume_role_arn" {
  description = "ARN of the IAM role used by SSM to stop/start EC2 instances"
  value       = aws_iam_role.ec2_automation_assume_role.arn
}