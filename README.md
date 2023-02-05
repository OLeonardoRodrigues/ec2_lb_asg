<!-- BEGIN_TF_DOCS -->
# ec2\_lb\_asg

- Criar 2 instâncias na AWS com NGINX (https://viacep.com.br/exemplo/jquery/)
- Criar um LB para a API-CEP
- Criar um ASG par API-CEP

[![Format Validate](https://github.com/CarlosDaniel3/ec2_lb_asg/actions/workflows/format-validate.yml/badge.svg)](https://github.com/CarlosDaniel3/ec2_lb_asg/actions/workflows/format-validate.yml)
[![Terraform](https://github.com/CarlosDaniel3/ec2_lb_asg/actions/workflows/main.yml/badge.svg)](https://github.com/CarlosDaniel3/ec2_lb_asg/actions/workflows/main.yml)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.46 |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.as_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.scaledown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.scaleup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_launch_template.template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.ec2_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | (Optional) Define what region the instance will be deployed | `string` | `"us-east-1"` | no |
| <a name="input_instance_ami"></a> [instance\_ami](#input\_instance\_ami) | (Optional) Instance's AMI. | `string` | `"ami-0ca7a41b0cf690c29"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | (Optional) AWS Instance type defines the hardware configuration of the machine. | `string` | `"t2.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) Name of the application. | `string` | `"server-nginx"` | no |
| <a name="input_template_key_name"></a> [template\_key\_name](#input\_template\_key\_name) | (Optional) Name of the template key. | `string` | `"carlos_daniel"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Subnet's information. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | VPC's information. |
<!-- END_TF_DOCS -->
