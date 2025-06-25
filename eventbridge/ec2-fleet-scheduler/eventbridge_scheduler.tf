resource "aws_scheduler_schedule" "schedule_to_start_ec2" {
  name                = "ScheduleToStartEc2-${var.scheduler_name}"
  description         = "Starts the specified EC2 instance"
  schedule_expression = var.schedule_ec2_fleet_start_time

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:startInstances"
    role_arn = aws_iam_role.ec2_fleet_scheduler_role.arn
    input = jsonencode({
      InstanceIds = var.ec2_ids
    })
  }
}

resource "aws_scheduler_schedule" "schedule_to_stop_ec2" {
  name                = "ScheduleToStopEc2-${var.scheduler_name}"
  description         = "Stop the specified EC2 instance"
  schedule_expression = var.schedule_ec2_fleet_stop_time

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:stopInstances"
    role_arn = aws_iam_role.ec2_fleet_scheduler_role.arn
    input = jsonencode({
      InstanceIds = var.ec2_ids
    })
  }
}