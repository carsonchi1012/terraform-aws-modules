variable "vpc_identifier" {
  description = "A name identifier to be used as a prefix for all VPC-related resources (e.g., VPC, subnets, IGW, NAT)."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC (e.g., 10.0.0.0/16)."
  type        = string
}

variable "vpc_public_subnets_cidr" {
  description = "List of CIDR blocks to be used for public subnets within the VPC."
  type        = list(string)
}

variable "vpc_private_subnets_cidr" {
  description = "List of CIDR blocks to be used for private subnets within the VPC."
  type        = list(string)
}

variable "enable_dns_hostnames" {
  description = "Enable or disable DNS hostnames in the VPC (default: true)."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable or disable DNS resolution support in the VPC (default: true)."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to apply to all resources created by this module."
  type        = map(string)
}
