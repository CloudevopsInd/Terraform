
variable "region" {
  default = "us-west-2"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_type_slave" {
  default = "t2.micro"
}


variable "subnet_name_tags" {
    type        = list(string)
  
}

variable "subnet_azs" {
    type        = list(string)
}

variable "ec2_name_tags" {
    type        = list(string)
  
}

variable "ec2_name_tags_slave" {
    type        = list(string)
  
}


variable "ami_id" {
    type = string
    description = "Ami id of ubuntu 20.04"
    default = "ami-03f65b8614a860c29"
}

variable "instance_count" {
    type = string
    description = "number for ec2 instances"
    default = "1"
  
}
variable "instance_count_slave" {
    type = string
    description = "number for ec2 instances"
    default = "0"
  
}
variable "web-trigger" {
    type = string
    description = "running number for trigger"
  
}

variable "db-trigger" {
    type = string
    description = "running number for trigger"
  
}

#variable "subnet_cidr_blocks" {
#  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#}


#variable "public_ip" {
#    type = string
#    description = "Enter your ec2 instance ip"  
#}