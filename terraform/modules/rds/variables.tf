variable storage_size {
    default = 20
}

variable engine {
    default = "mysql"
}

variable engine_version {
    default = "8.0"
}

variable instance_class {
    default = "db.t2.micro"
}

variable identifier {
    default = "wordpress"
}

variable db_name {
    default = "wordpress_db"
}

variable db_username {
    default = "yusufluai"
}

variable db_password {
    default = "yusufluai123"
}

variable kops_vpc_id {
}

# variable private_subnet_cidr {
#     default = "172.20.10.0/24"
# }

variable subnet_config{
   default = {
       "ap-southeast-1a" = "172.20.10.0/24"
       "ap-southeast-1b" = "172.20.11.0/24"
       "ap-southeast-1c" = "172.20.12.0/24"
   } 
}

variable db_subnet_group_name{

}

variable db_sg_name{
    
}