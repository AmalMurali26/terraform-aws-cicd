output "key_name" {
  description = "Name of the created EC2 key pair"
  value       = aws_key_pair.generated_key.key_name
}

output "ssm_parameter_key_arn" {
  description = "ARN of the SSM parameter storing the private key"
  value       = aws_ssm_parameter.ec2_private_key.arn
}

output "backend_secret_arn" {
  description = "ARN of the backend secret in AWS Secrets Manager"
  value       = aws_secretsmanager_secret.backend_env.arn
}

output "backend_secret_name" {
  description = "Name of the backend secret in AWS Secrets Manager"
  value       = aws_secretsmanager_secret.backend_env.name
}
