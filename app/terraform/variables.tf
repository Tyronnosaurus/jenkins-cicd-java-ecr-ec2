variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-08ec94f928cf25a9d" // Amazon Linux 2023 AMI 2023.6.20241010.0 x86_64 HVM kernel-6.1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "devops-bootcamp-key-pair" // Must be a previously created key pair
}
