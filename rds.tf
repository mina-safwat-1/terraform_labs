
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "subnet_group_rds"
  subnet_ids = [aws_subnet.subnets["priv_subnet_1"].id, aws_subnet.subnets["priv_subnet_2"].id]

  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}