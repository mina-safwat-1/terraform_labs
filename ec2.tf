
resource "aws_instance" "instances" {
  ami           = var.ami
  instance_type = var.instance_type

  count     = 2
  subnet_id = aws_subnet.subnets["${var.instances[count.index].subnet}"].id

  tags = {
    Name = var.instances[count.index].name
  }
  vpc_security_group_ids = [var.instances[count.index].type == "public" ? aws_security_group.public_sg.id : aws_security_group.private_sg.id]

  provisioner "local-exec" {
    command = "echo The server ${self.tags.Name} IP address is ${self.public_ip} >> servers_ips"
  }

}