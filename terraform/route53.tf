
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.service-two-zone.zone_id
  name    = "service2"
  type    = "A"

  alias {
    name                   = aws_lb.service-two-alb.dns_name
    zone_id                = aws_lb.service-two-alb.zone_id
    evaluate_target_health = false
  }
}
