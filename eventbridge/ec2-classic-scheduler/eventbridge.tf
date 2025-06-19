resource "aws_cloudwatch_event_rule" "schedule_to_start_ec2" {
  name                = "ScheduleToStartEc2-${var.scheduler_name}"
  description = "Custom rule used to start EC2 on a schedule"
  schedule_expression = var.schedule_ec2_start_time

  tags = var.tags
}

resource "aws_cloudwatch_event_rule" "schedule_to_stop_ec2" {
  name                = "ScheduleToStopEc2-${var.scheduler_name}"
  description = "Custom rule used to stop EC2 on a schedule"
  schedule_expression = var.schedule_ec2_stop_time

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "start_target_ec2" {
  rule      = aws_cloudwatch_event_rule.schedule_to_start_ec2.name
  target_id = "StartEC2Instance"
  arn       = "arn:aws:ssm:${var.ec2_region}::automation-definition/AWS-StartEC2Instance"
  role_arn  = aws_iam_role.ec2_event_target_role.arn

  input = jsonencode({
    InstanceId           = [var.ec2_id]
    AutomationAssumeRole = [aws_iam_role.ec2_automation_assume_role.arn]
  })
}

resource "aws_cloudwatch_event_target" "stop_target_ec2" {
  rule      = aws_cloudwatch_event_rule.schedule_to_stop_ec2.name
  target_id = "StopEC2Instance"
  arn       = "arn:aws:ssm:${var.ec2_region}::automation-definition/AWS-StopEC2Instance"
  role_arn  = aws_iam_role.ec2_event_target_role.arn

  input = jsonencode({
    InstanceId           = [var.ec2_id]
    AutomationAssumeRole = [aws_iam_role.ec2_automation_assume_role.arn]
  })
}