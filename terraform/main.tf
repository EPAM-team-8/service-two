resource "aws_instance" "Service-Two" {
  ami                    = "ami-00399ec92321828f5"
  instance_type          = "t2.small"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  key_name      = "epamclass"
  subnet_id = data.aws_subnet.private_subnet.id

  tags = {
    Name = "Service-Two"
  }
}

resource "null_resource" "ansible_automation" {
  triggers = {
    build_number = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "sleep 50; ansible-galaxy install -p ../ansible/roles -r ../ansible/requirements.yml --force && cd ../ansible && ansible-playbook --vault-password-file /var/lib/jenkins/mysecret.txt -i aws_ec2.yml service-two.yml"
  }
  depends_on = [
    aws_instance.Service-Two
  ]
}
