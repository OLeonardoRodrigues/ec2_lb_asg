locals {
  subnet_ids = { for k, v in aws_subnet.sub : v.tags.Name => v.id }

  common_tags = {
    Project   = "Curso AWS com Terraform"
    ManagedBy = "Terraform"
    Owner     = "Carlos Daniel"
  }
}