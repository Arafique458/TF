resource "aws_instance" "instance" {
  for_each               = var.components
  ami                    = data.aws_ami.centos.image_id
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = each.value["name"]
  }
}
resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.records]
  for_each = var.components
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance[each.value["name"]].private_ip
    }
    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/Arafique458/roboshop-shell.git",
      "cd roboshop-shell",
      "sudo bash ${each.value["name"]}.sh ${each.value["password"]}"
    ]
  }
}
# Aws route53 zone created
resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "${each.value["name"]}-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}

#resource "aws_instance" "catalogue" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "catalogue"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "catalogue" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "catalogue-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.catalogue.private_ip]
#}
#
#resource "aws_instance" "mongodb" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "mongodb"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "mongodb" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "mongodb-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.mongodb.private_ip]
#}
#
#resource "aws_instance" "redis" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "redis"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "redis" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "redis-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.redis.private_ip]
#}
#
#resource "aws_instance" "user" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "user"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "user" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "user-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.user.private_ip]
#}
#
#resource "aws_instance" "cart" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "cart"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "cart" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "cart-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.cart.private_ip]
#}
#
#resource "aws_instance" "mysql" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "mysql"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "mysql" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "mysql-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.mysql.private_ip]
#}
#
#resource "aws_instance" "shipping" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "shipping"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "shipping" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "shipping-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.shipping.private_ip]
#}
#
#resource "aws_instance" "rabbitmq" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "rabbitmq"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "rabbitmq" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "rabbitmq-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.rabbitmq.private_ip]
#}
#
#resource "aws_instance" "payment" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "payment"
#  }
#}
## Aws route53 zone created
#resource "aws_route53_record" "payment" {
#  zone_id = "Z088434732NM2WQFK5QS"
#  name    = "payment-dev.devopsdude.cloud"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.payment.private_ip]
#}




