variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  type    = string
  default = "devsecops-demo"
}

variable "vpc_cidr" {
  type    = string
  default = "10.30.0.0/16"
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "github_org" {
  type = string
}

variable "github_repo" {
  type    = string
  default = "devsecops-ecs-bluegreen"
}

variable "create_github_oidc_provider" {
  type    = bool
  default = true
}

variable "sbom_bucket_name" {
  type        = string
  description = "Globally unique bucket for SBOM files"
}
