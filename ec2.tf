resource "aws_instance" "instances" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  count     = 2
  subnet_id = module.network_module.subnets["${var.instances[count.index].subnet}"].id

  tags = {
    Name = var.instances[count.index].name
  }
  vpc_security_group_ids = [var.instances[count.index].type == "public" ? module.network_module.public_sg.id : module.network_module.private_sg.id]

  provisioner "local-exec" {
    command = var.instances[count.index].name == "bastion" ? "echo The server ${self.tags.Name} IP address is ${self.public_ip} > servers_ips" : ""
  }

}