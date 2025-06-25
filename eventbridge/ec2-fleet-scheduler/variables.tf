variable "scheduler_name" {
  description = "The name of scheduler"
  type        = string
}

variable "ec2_ids" {
  description = "The id of EC2 instances"
  type        = list(string)
}

variable "schedule_ec2_fleet_start_time" {
  description = "The start time of EC2 instances"
  type        = string
}

variable "schedule_ec2_fleet_stop_time" {
  description = "The stop time of EC2 instances"
  type        = string
}

variable "tags" {
  description = "Tags for all resources in this module"
  type        = map(string)
}