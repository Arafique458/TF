# This is done so if the owner changes the image we still have fresh image for out instances.
data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-Devops-Practice"
}
resource "aws_instance" "frontend" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "frontend" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "frontend-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "catalogue" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "catalogue" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "catalogue-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "mongodb" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "mongodb" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "mongodb-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "redis" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "redis"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "redis" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "redis-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "user"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "user" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "user-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "cart" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "cart-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "mysql"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "mysql" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "mysql-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "shipping"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "shipping" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "shipping-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "rabbitmq"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "rabbitmq-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "payment"
  }
}
# Aws route53 zone created
resource "aws_route53_record" "payment" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "payment-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 300
  records = [aws_instance.payment.private_ip]
}




