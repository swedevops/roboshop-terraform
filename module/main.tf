resource "aws_instance" "instance" {
  ami                    = data.aws_ami.centos.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]

  tags = {
    Name = local.name
  }
  # Name = var.component_name
}
resource "null_resource" "provisioner" {
  # count = var.provisioner ? 1 : 0
  depends_on = [aws_instance.instance, aws_route53_record.records]
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = var.app_type == "db" ? local.db_commands : local.app_commands
    #    [
#      "rm -rf roboshop-shell",
#      "git clone https://github.com/swedevops/roboshop-shell.git",
#      "cd roboshop-shell",
#      "sudo bash ${var.component_name}.sh ${var.password}"
#    ]
  }
}
resource "aws_route53_record" "records" {
  zone_id  = "Z0587270PBVKKHW0FPNL"
  name     = "${var.component_name}-dev.swedev99.online"
  type     = "A"
  ttl      = 30
  records  = [aws_instance.instance.private_ip]
}

resource "aws_iam_role" "role" {
  name = "${var.component_name}-${var.env}-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.component_name}-${var.env}-role"
  }
}






