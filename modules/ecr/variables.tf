variable "project_name" {
  type        = string
  description = "Project name prefix"
}
variable "frontend_ecr_name" {
  type        = string
  description = "Custom name for the Frontend ECR repository"
}

variable "backend_ecr_name" {
  type        = string
  description = "Custom name for the Backend ECR repository"
}
