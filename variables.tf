variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS Deployment Region"
}

variable "project_name" {
  type        = string
  default     = "terraform-ecs-project"
  description = "Name prefix applied to resources"
}

variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "EC2 Instance type for Jenkins server"
}

variable "image_tag" {
  type        = string
  default     = "1"
  description = "Image version/build number to deploy"
}

variable "backend_secret_name" {
  type        = string
  description = "Name of the AWS Secrets Manager secret for the backend"
  default     = "secrets/sampleapp"
}

variable "db_password" {
  type        = string
  description = "Master password for RDS PostgreSQL instance"
  default     = "mysecretpassword"
  sensitive   = true
}

variable "jenkins_instance_name" {
  type        = string
  description = "Name tag for Jenkins server"
}

variable "vpc_name" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "public_subnet_1_name" {
  type = string
}

variable "public_subnet_2_name" {
  type = string
}

variable "private_subnet_1_name" {
  type = string
}

variable "private_subnet_2_name" {
  type = string
}

variable "public_route_table_name" {
  type = string
}

variable "private_route_table_name" {
  type = string
}
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR for public subnet 1"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR for public subnet 2"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR for private subnet 1"
}

# ADDED: Variable for Private Subnet 2 CIDR
variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR for private subnet 2"
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
  description = "Name for the ECS Tasks Security Group"
}

variable "rds_sg_name" {
  type        = string
  description = "Name for the RDS PostgreSQL Security Group"
}


variable "ecs_execution_role_name" {
  type        = string
  description = "Name for the ECS Task Execution Role"
}

variable "ecs_secrets_policy_name" {
  type        = string
  description = "Name for the Secrets policy attached to execution role"
}

variable "ecs_task_role_name" {
  type        = string
  description = "Name for the ECS Task Role"
}

variable "ecs_task_secrets_policy_name" {
  type        = string
  description = "Name for the Secrets policy attached to task role"
}

variable "jenkins_role_name" {
  type        = string
  description = "Name for the Jenkins EC2 IAM Role"
}

variable "jenkins_instance_profile_name" {
  type        = string
  description = "Name for the Jenkins IAM Instance Profile"
}


variable "ec2_key_name" {
  type        = string
  description = "Name for the EC2 Key Pair"
}

variable "ssm_pem_key_path" {
  type        = string
  description = "SSM Parameter Store path for the EC2 private key"
}

variable "secrets_manager_secret_name" {
  type        = string
  description = "Name for the AWS Secrets Manager backend secret"
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
  description = "Initial PostgreSQL database name"
}

variable "db_username" {
  type        = string
  default     = "postgres"
  description = "Master username for PostgreSQL database"
}

variable "db_instance_class" {
  type        = string
  default     = "db.t4g.micro"
  description = "RDS DB instance class"
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


variable "frontend_ecr_name" {
  type        = string
  description = "Name for the Frontend ECR Repository"
}

variable "backend_ecr_name" {
  type        = string
  description = "Name for the Backend ECR Repository"
}


variable "ecs_cluster_name" {
  type        = string
  description = "Name for the ECS Cluster"
}

variable "frontend_log_group_name" {
  type        = string
  description = "Name for Frontend CloudWatch Log Group"
}

variable "backend_log_group_name" {
  type        = string
  description = "Name for Backend CloudWatch Log Group"
}

variable "redis_log_group_name" {
  type        = string
  description = "Name for Redis CloudWatch Log Group"
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
  description = "Name for Frontend ECS Service"
}

variable "backend_service_name" {
  type        = string
  description = "Name for Backend ECS Service"
}

variable "frontend_scaling_policy_name" {
  type        = string
  description = "Name for Frontend CPU scaling policy"
}

variable "backend_scaling_policy_name" {
  type        = string
  description = "Name for Backend CPU scaling policy"
}
