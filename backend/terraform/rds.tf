# # ====================
# # RDS Parameter Group
# # ====================
# resource "aws_db_parameter_group" "progate-db-pg" {
# 	name        = "progate-db-pg"
# 	family      = "postgres14"
# 	description = "Progate DB parameter group"

# 	parameter {
# 		name  = "rds.force_ssl"
# 		value = "0"
# 	}
# }

# # ====================
# # RDS Instance
# # ====================
# # RDSサーバーの設定
# resource "aws_db_instance" "main" {
# 	identifier             = "progate-db"
# 	db_name                = "progate"
# 	allocated_storage      = 20
# 	storage_type           = "gp2"
# 	engine                 = "postgres"
# 	engine_version         = "14.12"
# 	instance_class         = "db.t3.micro"
# 	password               = "${var.rds_pass}"
# 	username               = "${var.rds_username}"
# 	db_subnet_group_name   = "${aws_db_subnet_group.progate-db-subnet.name}"
# 	vpc_security_group_ids = ["${aws_security_group.progate-db-sg.id}"]
# 	parameter_group_name   = "${aws_db_parameter_group.progate-db-pg.name}"
# 	skip_final_snapshot    = true
# 	multi_az               = false
# 	availability_zone      = "us-west-2a"
# 	publicly_accessible    = true
# 	tags = {
# 		Name = "progate-db"
# 	}
# }

# # DB サブネットグループの設定
# resource "aws_db_subnet_group" "progate-db-subnet" {
# 	name        = "progate-db-subnet"
# 	description = "progate-db-subnet"
# 	subnet_ids  =["${aws_subnet.private_db_1.id}","${aws_subnet.private_db_2.id}"]
# 	tags = {
# 		Name = "progate-db-subnet"
# 	}
# }