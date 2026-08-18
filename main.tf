terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. VPC Module (Supports 2 private subnets for RDS)
module "vpc" {
  source                = "./modules/vpc"
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  az_1                  = "${var.aws_region}a"
  az_2                  = "${var.aws_region}b"

  vpc_name                 = var.vpc_name
  igw_name                 = var.igw_name
  nat_name                 = var.nat_name
  public_subnet_1_name     = var.public_subnet_1_name
  public_subnet_2_name     = var.public_subnet_2_name
  private_subnet_1_name    = var.private_subnet_1_name
  private_subnet_2_name    = var.private_subnet_2_name
  public_route_table_name  = var.public_route_table_name
  private_route_table_name = var.private_route_table_name
}

# 2. Security Groups Module
module "sg" {
  source          = "./modules/sg"
  project_name    = var.project_name
  vpc_id          = module.vpc.vpc_id
  alb_sg_name     = var.alb_sg_name
  jenkins_sg_name = var.jenkins_sg_name
  ecs_sg_name     = var.ecs_sg_name
  rds_sg_name     = var.rds_sg_name
}

# 3. IAM Module
module "iam" {
  source                        = "./modules/iam"
  project_name                  = var.project_name
  ecs_execution_role_name       = var.ecs_execution_role_name
  ecs_secrets_policy_name       = var.ecs_secrets_policy_name
  ecs_task_role_name            = var.ecs_task_role_name
  ecs_task_secrets_policy_name  = var.ecs_task_secrets_policy_name
  jenkins_role_name             = var.jenkins_role_name
  jenkins_instance_profile_name = var.jenkins_instance_profile_name
}

# 4. Secrets Module (Stores DB Password & RDS Endpoint)
module "secrets" {
  source                      = "./modules/secrets"
  project_name                = var.project_name
  db_password                 = var.db_password
  db_host                     = module.rds.db_instance_address
  ec2_key_name                = var.ec2_key_name
  ssm_pem_key_path            = var.ssm_pem_key_path
  secrets_manager_secret_name = var.secrets_manager_secret_name
}

# 5. RDS Module
module "rds" {
  source               = "./modules/rds"
  project_name         = var.project_name
  private_subnet_1_id  = module.vpc.private_subnet_1_id
  private_subnet_2_id  = module.vpc.private_subnet_2_id
  rds_sg_id            = module.sg.rds_sg_id # Change ecs_sg_id to rds_sg_id here
  db_password          = var.db_password
  db_instance_class    = var.db_instance_class
  db_subnet_group_name = var.db_subnet_group_name
  db_identifier        = var.db_identifier
  db_name              = var.db_name
  db_username          = var.db_username
}

# 6. ALB Module
module "alb" {
  source             = "./modules/alb"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
  alb_sg_id          = module.sg.alb_sg_id
  alb_name           = var.alb_name
  frontend_tg_name   = var.frontend_tg_name
  backend_tg_name    = var.backend_tg_name
}

# 7. ECR Module
module "ecr" {
  source            = "./modules/ecr"
  project_name      = var.project_name
  frontend_ecr_name = var.frontend_ecr_name
  backend_ecr_name  = var.backend_ecr_name
}

# 8. ECS Module
module "ecs" {
  source = "./modules/ecs"

  project_name           = var.project_name
  aws_region             = var.aws_region
  private_subnet_id      = module.vpc.private_subnet_1_id
  ecs_sg_id              = module.sg.ecs_sg_id
  ecs_execution_role_arn = module.iam.ecs_execution_role_arn
  ecs_task_role_arn      = module.iam.ecs_task_role_arn
  frontend_tg_arn        = module.alb.frontend_tg_arn
  backend_tg_arn         = module.alb.backend_tg_arn

  frontend_ecr_url    = module.ecr.frontend_repository_url
  backend_ecr_url     = module.ecr.backend_repository_url
  backend_secret_name = module.secrets.backend_secret_name
  image_tag           = var.image_tag

  ecs_cluster_name             = var.ecs_cluster_name
  frontend_log_group_name      = var.frontend_log_group_name
  backend_log_group_name       = var.backend_log_group_name
  redis_log_group_name         = var.redis_log_group_name
  frontend_task_family         = var.frontend_task_family
  backend_task_family          = var.backend_task_family
  frontend_service_name        = var.frontend_service_name
  backend_service_name         = var.backend_service_name
  frontend_scaling_policy_name = var.frontend_scaling_policy_name
  backend_scaling_policy_name  = var.backend_scaling_policy_name
}

# 9. Jenkins EC2 Module
module "jenkins" {
  source                   = "./modules/jenkins"
  project_name             = var.project_name
  jenkins_instance_name    = var.jenkins_instance_name
  public_subnet_id         = module.vpc.public_subnet_1_id
  jenkins_sg_id            = module.sg.jenkins_sg_id
  jenkins_instance_profile = module.iam.jenkins_instance_profile_name
  key_name                 = module.secrets.key_name
  instance_type            = var.instance_type
}
