output "vpc" {
  description = "VPC's information."
  value       = aws_vpc.ec2_vpc
}

output "subnet" {
  description = "Subnet's information."
  value       = aws_subnet.sub
}
