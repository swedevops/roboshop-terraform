data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
data "aws_security_group" "test" {
  name = "test"
}
variable "instance_type" {
  default = "t3.micro"
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]

  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "frontend-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "mongodb"
  }
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "mongodb-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catlogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "catalogue"
  }
}
resource "aws_route53_record" "catlogue" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "catlogue-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catlogue.private_ip]
}
resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "redis"
  }
}
resource "aws_route53_record" "redis" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "redis-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}
resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "user"
  }
}
resource "aws_route53_record" "user" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "user-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}
resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "cart"
  }
}
resource "aws_route53_record" "cart" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "cart-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "mysql-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}
resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "shipping"
  }
}
resource "aws_route53_record" "shipping" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "shipping-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}


resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "rabbitmq"
  }
}
resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "rabbitmq-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}
resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.test.id]
  tags = {
    Name = "payment"
  }
}
resource "aws_route53_record" "payment" {
  zone_id = "Z0587270PBVKKHW0FPNL"
  name    = "payment-dev.swedev99.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}


