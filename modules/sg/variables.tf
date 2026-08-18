variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where security groups will be created"
}

variable "alb_sg_name" {
  type        = string
  description = "Name for the ALB Security Group"
}

variable "jenkins_sg_name" {
  type        = string
  description = "Name for the Jenkins EC2 Security Group"
}

variable "ecs_sg_name" {
  type        = string
  description = "Name for the ECS Fargate Tasks Security Group"
}

variable "rds_sg_name" {
  type        = string
  description = "Name for the RDS PostgreSQL Security Group"
}
