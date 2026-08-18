aws_region    = "ap-south-1"
project_name  = "terraform-ecs-project"
instance_type = "t3.micro"
image_tag     = "build-1"

jenkins_instance_name = "custom-jenkins-server"

vpc_name                 = "custom-main-vpc"
igw_name                 = "custom-internet-gateway"
nat_name                 = "custom-nat-gateway"
public_subnet_1_name     = "custom-public-subnet-1"
public_subnet_2_name     = "custom-public-subnet-2"
private_subnet_1_name    = "custom-private-subnet-1"
private_subnet_2_name    = "custom-private-subnet-2"
public_route_table_name  = "custom-public-route-table"
private_route_table_name = "custom-private-route-table"
vpc_cidr                 = "10.0.0.0/16"
public_subnet_1_cidr     = "10.0.1.0/24"
public_subnet_2_cidr     = "10.0.2.0/24"
private_subnet_1_cidr    = "10.0.3.0/24"
private_subnet_2_cidr    = "10.0.4.0/24"


alb_sg_name     = "custom-alb-security-group"
jenkins_sg_name = "custom-jenkins-security-group"
ecs_sg_name     = "custom-ecs-security-group"
rds_sg_name     = "custom-rds-security-group"


ec2_key_name                = "custom-jenkins-ec2-key"
ssm_pem_key_path            = "/custom-project/ec2/pem_key"
secrets_manager_secret_name = "secrets/sampleapp"


db_subnet_group_name = "custom-rds-db-subnet-group"
db_identifier        = "custom-postgres-db"
db_name              = "postgres"
db_username          = "postgres"
db_password          = "your_secure_db_password_here"
db_instance_class    = "db.t4g.micro"


# ALB & Target Group Names
alb_name         = "custom-alb"
frontend_tg_name = "custom-tg-80"
backend_tg_name  = "custom-tg-8000"


# ECR Repository Names
frontend_ecr_name = "custom-frontend-repo"
backend_ecr_name  = "custom-backend-repo"


# ECS Cluster, Log Groups, Tasks, and Services
ecs_cluster_name             = "custom-ecs-cluster"
frontend_log_group_name      = "/ecs/custom-frontend-logs"
backend_log_group_name       = "/ecs/custom-backend-logs"
redis_log_group_name         = "/ecs/custom-redis-logs"
frontend_task_family         = "frontend-task"
backend_task_family          = "backend-stack-task"
frontend_service_name        = "custom-frontend-service"
backend_service_name         = "custom-backend-service"
frontend_scaling_policy_name = "custom-frontend-cpu-scaling"
backend_scaling_policy_name  = "custom-backend-cpu-scaling"



# IAM Resource Names
ecs_execution_role_name       = "custom-ecs-execution-role"
ecs_secrets_policy_name       = "custom-ecs-secrets-policy"
ecs_task_role_name            = "custom-ecs-task-role"
ecs_task_secrets_policy_name  = "custom-ecs-task-secrets-policy"
jenkins_role_name             = "custom-jenkins-role"
jenkins_instance_profile_name = "custom-jenkins-instance-profile"
