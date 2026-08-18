# 1. DB Subnet Group across both private subnets
resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "postgres" {
  identifier                  = var.db_identifier
  engine                      = "postgres"
  engine_version              = "15" # AWS will use the default supported 15.x version
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
  instance_class              = var.db_instance_class
  allocated_storage           = 20
  max_allocated_storage       = 100
  storage_type                = "gp3"
  db_name                     = var.db_name
  username                    = var.db_username
  password                    = var.db_password
  db_subnet_group_name        = aws_db_subnet_group.main.name
  vpc_security_group_ids      = [var.rds_sg_id]
  skip_final_snapshot         = true
  publicly_accessible         = false
}
