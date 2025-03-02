resource "aws_route_table_association" "pub_route_association_1" {
  subnet_id      = aws_subnet.subnets["pub_subnet_1"].id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "pub_route_association_2" {
  subnet_id      = aws_subnet.subnets["pub_subnet_2"].id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "priv_route_association_1" {
  subnet_id      = aws_subnet.subnets["priv_subnet_1"].id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "priv_route_association_2" {
  subnet_id      = aws_subnet.subnets["priv_subnet_2"].id
  route_table_id = aws_route_table.private_route.id
}