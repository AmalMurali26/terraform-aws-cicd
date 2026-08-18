resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.ec2_key_name
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "aws_ssm_parameter" "ec2_private_key" {
  name        = var.ssm_pem_key_path
  description = "Private key for EC2 Jenkins instance"
  type        = "SecureString"
  value       = tls_private_key.ec2_key.private_key_pem
}

resource "aws_secretsmanager_secret" "backend_env" {
  name                    = var.secrets_manager_secret_name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "backend_env_val" {
  secret_id = aws_secretsmanager_secret.backend_env.id

  secret_string = jsonencode({
    DB_HOST = var.db_host
  })
}
