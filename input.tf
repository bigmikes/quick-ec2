variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "The AWS region where VPC resources and EC2 instance will be deployed."
}

variable "profile" {
  type        = string
  default     = "default"
  description = "The AWS profile that Terraform uses to find the AWS credentials."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type that is going to be deployed."
}

variable "ami" {
  type        = string
  default     = "ami-0db188056a6ff81ae"
  description = "The AMI that is going to be deployed."
}

variable "public_ssh_key_path" {
  type        = string
  description = "Path to the local file containing the public SSH key for the EC2 VM."
}