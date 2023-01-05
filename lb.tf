resource "aws_lb" "alb" {
  name            = "Terraform-ALB"
  security_groups = [aws_security_group.web.id]
  subnets         = [aws_subnet.sub["pub_a"].id, aws_subnet.sub["pub_b"].id]
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ec2_vpc.id

  health_check {
    path              = "/"
    healthy_threshold = 2
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
