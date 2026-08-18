output "jenkins_public_ip" {
  description = "Public IP to access Jenkins UI at http://<IP>:8080"
  value       = module.jenkins.jenkins_public_ip
}

output "alb_dns_name" {
  description = "Public URL for application traffic"
  value       = module.alb.alb_dns_name
}

output "ecr_frontend_repo" {
  value = module.ecr.frontend_repository_url
}

output "ecr_backend_repo" {
  value = module.ecr.backend_repository_url
}

output "ec2_private_key_ssm_parameter" {
  description = "SSM Parameter path to retrieve EC2 SSH Private Key"
  value       = "/${var.project_name}/jenkins/pem_key"
}

output "rds_endpoint" {
  description = "Connection endpoint for the RDS PostgreSQL database"
  value       = module.rds.db_instance_endpoint
}
