variable "env" {
  description = "Environment"
  default     = "default"
}

variable "name" {
  description = "Name to be used on all resources as prefix"
}

variable "ami" {
  description = "AMI for asg"
}

variable "instance_type" {
  description = "Instance type for asg"
}

variable "key_name" {
  description = "KEY for asg"
}

variable "security_groups" {
  description = "A list of security group IDs to associate with"
  type        = "list"
}

variable "subnets" {
  description = "The VPC Subnet IDs to launch in"
  type        = "list"
}

variable "target_group_arns" {
  description = "The target group ARNS for the alb"
  type        = "list"
  default     = []
}

variable "health_check_type" {
  description = "Healthcheck type for asg (ELB or EC2)"
  default     = "ELB"
}

variable "enable_monitoring" {
  description = "Enable monitoring of autoscale group instances"
  default     = true
}

variable "min_size" {
  description = "Minimum size of autoscale group"
  default     = 1
}

variable "max_size" {
  description = "Maximum size of autoscale group"
  default     = 2
}

variable "desired_capacity" {
  description = "Desired capacity of autoscale group"
  default     = false
}

variable "wait_for_capacity_timeout" {
  description = "Time to wait for autoscale group to reach healthy state"
  default     = "10m"
}

variable "associate_public_ip_address" {
  description = "Associate a public ip address with each instance"
  default     = false
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  default     = ""
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = " "
}