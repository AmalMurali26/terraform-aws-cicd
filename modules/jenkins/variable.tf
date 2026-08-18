variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "public_subnet_id" {
  type        = string
  description = "Public Subnet ID where Jenkins EC2 instance runs"
}

variable "jenkins_sg_id" {
  type        = string
  description = "Security Group ID for Jenkins instance"
}

variable "jenkins_instance_profile" {
  type        = string
  description = "IAM Instance Profile Name for Jenkins EC2"
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair name"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 Instance type for Jenkins"
}
variable "jenkins_instance_name" {
  type        = string
  description = "Custom Name tag for the Jenkins EC2 instance"
}
