data "aws_security_group" "epam-sg" {
  filter {
    name   = "group-name"
    values = ["bogart-security"]
  }
}