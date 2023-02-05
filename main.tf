/*
 * # ec2_lb_asg
 *
 * - Criar 2 instâncias na AWS com NGINX (https://viacep.com.br/exemplo/jquery/)
 * - Criar um LB para a API-CEP
 * - Criar um ASG par API-CEP
 */

terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}
