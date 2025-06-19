variable "scheduler_name" {
  description = "The name of scheduler"
  type        = string
}

variable "ec2_id" {
  description = "The id of EC2 instance"
  type        = string
}

variable "ec2_region" {
  description = "The region of EC2 instance"
  type        = string
}

variable "schedule_timezone" {
  description = "The timezone of target EC2 instance"
  type        = string
  default     = "UTC"
}

variable "schedule_ec2_start_time" {
  description = "The start time of EC2 instance"
  type        = string
}

variable "schedule_ec2_stop_time" {
  description = "The stop time of EC2 instance"
  type        = string
}

variable "tags" {
  description = "Tags for all resources in this module"
  type        = map(string)
}