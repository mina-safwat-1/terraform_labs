output "subnets" {
  value = aws_subnet.subnets
}

output "public_sg" {
  value = aws_security_group.public_sg
}

output "private_sg" {
  value = aws_security_group.private_sg
}