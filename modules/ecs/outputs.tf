output "cluster_name" {
  description = "Name of the created ECS Cluster"
  value       = aws_ecs_cluster.main.name
}

output "cluster_arn" {
  description = "ARN of the created ECS Cluster"
  value       = aws_ecs_cluster.main.arn
}

output "frontend_service_name" {
  description = "Name of the Frontend ECS Service"
  value       = aws_ecs_service.frontend.name
}

output "backend_service_name" {
  description = "Name of the Backend ECS Service"
  value       = aws_ecs_service.backend.name
}

output "frontend_task_definition_family" {
  description = "Family name of the Frontend Task Definition"
  value       = aws_ecs_task_definition.frontend.family
}

output "backend_task_definition_family" {
  description = "Family name of the Backend Task Definition"
  value       = aws_ecs_task_definition.backend.family
}

output "frontend_log_group_name" {
  description = "Name of the CloudWatch Log Group for Frontend"
  value       = aws_cloudwatch_log_group.frontend.name
}

output "backend_log_group_name" {
  description = "Name of the CloudWatch Log Group for Backend"
  value       = aws_cloudwatch_log_group.backend.name
}
