variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "db_password" {
  type        = string
  description = "Master password for PostgreSQL DB"
  sensitive   = true
}

variable "db_host" {
  type        = string
  default     = "127.0.0.1"
  description = "RDS or PostgreSQL host address"
}

variable "ec2_key_name" {
  type        = string
  description = "Name for the EC2 Key Pair"
}

variable "ssm_pem_key_path" {
  type        = string
  description = "SSM Parameter Store path for the private key"
}

variable "secrets_manager_secret_name" {
  type        = string
  description = "Name for the AWS Secrets Manager secret"
}
