resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_sub"
  subnet_ids = var.rds_sub_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_security_group" "rds_security_group" {
  name        = "RDS-Security-Group"
  description = "Allow inbound access to RDS MySQL"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS Security Group"
  }
}
resource "aws_db_instance" "vr" {
  identifier            = var.db_identifier
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.db_instance_class
  allocated_storage     = var.db_allocated_storage
  storage_type          = var.db_storage_type
  username              = var.db_username
  password              = var.db_password
  db_subnet_group_name  = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  parameter_group_name  = var.db_parameter_group_name
  skip_final_snapshot   = true
 
  tags = {
    Name = "vr infra"
  }
}