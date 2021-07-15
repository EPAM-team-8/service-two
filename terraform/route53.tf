data "aws_route53_zone" "Service-Two" {
  name    = "rabbit-mq.xyz"
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.Service-Two.zone_id
  name    = "service.rabbit-mq.xyz"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.Service-Two.public_ip]
}