data "aws_vpc" "kops_vpc"{
  id = var.kops_vpc_id
}


resource "aws_subnet" "private_subnet"{
  for_each = var.subnet_config
  vpc_id = data.aws_vpc.kops_vpc.id
  cidr_block = each.value
  availability_zone = each.key
}


resource "aws_security_group" "kops_db_sg" {
  name        = var.db_sg_name
  description = "Only allow kops cluster inbound traffic"
  vpc_id      = data.aws_vpc.kops_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["172.20.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_db_subnet_group" "kops_private_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.private_subnet["ap-southeast-1a"].id,
                aws_subnet.private_subnet["ap-southeast-1b"].id,
                aws_subnet.private_subnet["ap-southeast-1c"].id
               ]
}

resource "aws_db_instance" "kops_db" {
  allocated_storage      = var.storage_size
  publicly_accessible    = true
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class 
  name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.kops_db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.kops_private_subnet_group.id
  skip_final_snapshot    = true
}

