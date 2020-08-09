# Set Terraform variables.

variable "region" {
  type        = string
  description = "AWS region where the Amazon Connect instance is deployed."
  default     = "us-east-1"
}

variable "instanceId" {
  type        = string
  description = "The Connect instance ID."
  default     = "2c7326de-916d-2853-9fcf-ac1a631f1326"
}

variable "queueName" {
  type        = string
  description = "Name of the primary Amazon Connect Queue."
  default     = "BasicQueue"
}
