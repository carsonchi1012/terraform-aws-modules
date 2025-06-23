variable "scheduler_name" {
  description = "The name of scheduler"
  type        = string
}

variable "notebook_id" {
  description = "The id of SageMaker AI notebook"
  type        = string
}

variable "schedule_notebook_start_time" {
  description = "The start time of SageMaker AI notebook"
  type        = string
}

variable "schedule_notebook_stop_time" {
  description = "The stop time of SageMaker AI notebook"
  type        = string
}

variable "tags" {
  description = "Tags for all resources in this module"
  type        = map(string)
}