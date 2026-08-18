variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "aws_region" {
  type        = string
  description = "AWS deployment region"
}

variable "private_subnet_id" {
  type        = string
  description = "Private Subnet ID where ECS Fargate services run"
}

variable "ecs_sg_id" {
  type        = string
  description = "Security Group ID assigned to ECS tasks"
}

variable "ecs_execution_role_arn" {
  type        = string
  description = "IAM Execution Role ARN for image pulling and log routing"
}

variable "ecs_task_role_arn" {
  type        = string
  description = "IAM Task Role ARN for runtime permissions"
}

variable "frontend_tg_arn" {
  type        = string
  description = "ALB Target Group ARN for Frontend"
}

variable "backend_tg_arn" {
  type        = string
  description = "ALB Target Group ARN for Backend"
}

variable "frontend_ecr_url" {
  type        = string
  description = "URL of Frontend ECR Repository"
}

variable "backend_ecr_url" {
  type        = string
  description = "URL of Backend ECR Repository"
}

variable "backend_secret_name" {
  type        = string
  description = "Name of the AWS Secrets Manager secret for backend config"
}

variable "image_tag" {
  type        = string
  description = "Container image build tag"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name for the ECS Cluster"
}

variable "frontend_log_group_name" {
  type        = string
  description = "Name for the Frontend CloudWatch Log Group"
}

variable "backend_log_group_name" {
  type        = string
  description = "Name for the Backend CloudWatch Log Group"
}

variable "redis_log_group_name" {
  type        = string
  description = "Name for the Redis CloudWatch Log Group"
}

variable "frontend_task_family" {
  type        = string
  description = "Family name for Frontend Task Definition"
}

variable "backend_task_family" {
  type        = string
  description = "Family name for Backend Task Definition"
}

variable "frontend_service_name" {
  type        = string
  description = "Name for the Frontend ECS Service"
}

variable "backend_service_name" {
  type        = string
  description = "Name for the Backend ECS Service"
}

variable "frontend_scaling_policy_name" {
  type        = string
  description = "Name for Frontend CPU scaling policy"
}

variable "backend_scaling_policy_name" {
  type        = string
  description = "Name for Backend CPU scaling policy"
}
