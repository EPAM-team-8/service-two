data "aws_security_group" "epam-sg" {
  filter {
    name   = "group-name"
    values = ["bogart-security"]
  }
}

data "aws_vpc" "epam-vpc" {
  filter {
    name   = "tag:Name"
    values = ["epam-vpc"]
  }
}

data "aws_route53_zone" "Service-Two" {
  name = "rabbit-mq.xyz"
}

data "aws_subnet_ids" "main-subnets" {
  vpc_id = data.aws_vpc.epam-vpc.id
  tags = {
    env = "test"
  }
}