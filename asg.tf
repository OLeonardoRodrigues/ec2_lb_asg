resource "aws_launch_template" "template" {
  name          = "server-template"
  image_id      = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.template_key_name

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.web.id]
  }
}

resource "aws_autoscaling_group" "as_group" {
  name                      = "terraform-autoscaling"
  vpc_zone_identifier       = [aws_subnet.sub["pub_a"].id, aws_subnet.sub["pub_b"].id]
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 240
  health_check_type         = "ELB"
  force_delete              = true
  target_group_arns         = [aws_lb_target_group.alb_tg.id]

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "scaleup" {
  name                   = "Scale Up"
  autoscaling_group_name = aws_autoscaling_group.as_group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "180"
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scaledown" {
  name                   = "Scale Down"
  autoscaling_group_name = aws_autoscaling_group.as_group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "180"
  policy_type            = "SimpleScaling"
}
