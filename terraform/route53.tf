
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.Service-Two.zone_id
  name    = "service.rabbit-mq.xyz"
  type    = "A"

  alias {
    name                   = aws_lb.service-two-alb.dns_name
    zone_id                = aws_lb.service-two-alb.zone_id
    evaluate_target_health = false
  }
}
