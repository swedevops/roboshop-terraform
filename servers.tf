resource "aws_instance" "instance" {
  for_each      = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.test.id]

  tags = {
    Name = each.value["name"]
  }

  provisioner "remote-exec" {
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.private_ip
  }
  inline = [
    "rm -rf roboshop-shell",
    "https://github.com/swedevops/roboshop-shell.git",
    "cd roboshop-shell",
    "sudo bash ${each.value["name"]}.sh"
  ]
}
}
resource "aws_route53_record" "records" {
  for_each  = var.components
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "${each.value["name"]}-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}





