variable "rds_sub_ids"{
    description="RDS Subnet Ids"
    type=list(string)
    default=["subnet-0d6bbd650000561c8","subnet-0aab47254fcbb0ed5","subnet-03600f1b74b403f97"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-0eda9f3976a3b1424"
}

variable "db_identifier" {
  type    = string
  default = "my-rds-instance"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "db_engine_version" {
  type    = string
  default = "5.7"
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_storage_type" {
  type    = string
  default = "gp2"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
  default = "password"
}

variable "db_parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}


