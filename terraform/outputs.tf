output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "github_actions_role_arn" {
  description = "Add as the AWS_ROLE_ARN secret in GitHub"
  value       = aws_iam_role.github_deploy.arn
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "sbom_bucket" {
  value = aws_s3_bucket.sbom.id
}

output "names_for_github_variables" {
  value = {
    ECS_CLUSTER     = aws_ecs_cluster.this.name
    ECS_SERVICE     = aws_ecs_service.app.name
    ECS_TASK_FAMILY = aws_ecs_task_definition.app.family
    CODEDEPLOY_APP  = aws_codedeploy_app.this.name
    CODEDEPLOY_DG   = aws_codedeploy_deployment_group.this.deployment_group_name
    ECR_REPOSITORY  = aws_ecr_repository.app.name
    SBOM_BUCKET     = aws_s3_bucket.sbom.id
  }
}
