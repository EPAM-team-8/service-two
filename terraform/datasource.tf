data "aws_security_group" "epam-sg" {
  filter {
    name   = "group-name"
    values = ["bogart-security"]
  }
}

data "aws_vpc" "epam-vpc"{
  filter {
    name   = "tag:Name"
    values = ["epam-vpc"]
  }
}