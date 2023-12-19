resource "aws_instance" "instance" {
  ami                    = data.aws_ami.centos.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = locals.name
  }
}
resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.records]
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/Arafique458/roboshop-shell.git",
      "cd roboshop-shell",
      "sudo bash ${var.components_name}.sh ${var.password}"
    ]
  }
}
# Aws route53 zone created
resource "aws_route53_record" "records" {
  zone_id = "Z088434732NM2WQFK5QS"
  name    = "${var.components_name}-dev.devopsdude.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}