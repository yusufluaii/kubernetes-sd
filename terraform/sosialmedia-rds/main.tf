provider "aws"{
    region = "ap-southeast-1"
}

module sosialmedia_rds {
  source = "../modules/rds"
  kops_vpc_id = "vpc-0a2a5592af6790e51"
  identifier = "sosialmedia"
  db_name = "dbsosmed_staging"
  db_username = "yusufluai"
  db_password = "yusufluai123"
  subnet_config = var.subnet_config
  db_sg_name = "sosialmedia-db-sg"
  db_subnet_group_name= "sosialmedia-db-subnet-group"
}
