variable "project_name" {
  type        = string
  description = "Project name prefix"
}
variable "ecs_execution_role_name" {
  type        = string
  description = "Name for the ECS Task Execution Role"
}

variable "ecs_secrets_policy_name" {
  type        = string
  description = "Name for the Secrets Manager policy attached to execution role"
}

variable "ecs_task_role_name" {
  type        = string
  description = "Name for the ECS Task Role"
}

variable "ecs_task_secrets_policy_name" {
  type        = string
  description = "Name for the Secrets Manager policy attached to task role"
}

variable "jenkins_role_name" {
  type        = string
  description = "Name for the Jenkins EC2 IAM Role"
}

variable "jenkins_instance_profile_name" {
  type        = string
  description = "Name for the Jenkins IAM Instance Profile"
}
