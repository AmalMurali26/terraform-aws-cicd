variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "private_subnet_1_id" {
  type        = string
  description = "First Private Subnet ID"
}

variable "private_subnet_2_id" {
  type        = string
  description = "Second Private Subnet ID"
}

variable "rds_sg_id" {
  type        = string
  description = "Security Group ID for RDS passed from the sg module"
}

variable "db_password" {
  type        = string
  description = "Master password for PostgreSQL DB"
  sensitive   = true
}

variable "db_instance_class" {
  type        = string
  default     = "db.t4g.micro"
  description = "RDS DB instance class"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Name for the RDS DB Subnet Group"
}

variable "db_identifier" {
  type        = string
  description = "Identifier for the RDS PostgreSQL DB instance"
}

variable "db_name" {
  type        = string
  default     = "postgres"
  description = "Initial database name"
}

variable "db_username" {
  type        = string
  default     = "postgres"
  description = "Master username for the PostgreSQL database"
}
