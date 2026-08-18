variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_1_id" {
  type        = string
  description = "Public Subnet 1"
}

variable "public_subnet_2_id" {
  type        = string
  description = "Public Subnet 2"
}

variable "alb_sg_id" {
  type        = string
  description = "ALB Security Group ID"
}

variable "alb_name" {
  type        = string
  description = "Name for the Application Load Balancer"
}

variable "frontend_tg_name" {
  type        = string
  description = "Name for the Frontend Target Group (Port 80)"
}

variable "backend_tg_name" {
  type        = string
  description = "Name for the Backend Target Group (Port 8000)"
}
