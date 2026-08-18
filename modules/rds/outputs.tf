output "db_instance_endpoint" {
  description = "Connection endpoint for the RDS instance (includes port)"
  value       = aws_db_instance.postgres.endpoint
}

output "db_instance_address" {
  description = "Hostname address of the RDS database"
  value       = aws_db_instance.postgres.address
}
