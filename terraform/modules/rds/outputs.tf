output kops_db_dns {
    value = aws_db_instance.kops_db.endpoint
}
