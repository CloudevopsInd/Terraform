region = "us-west-2"
cidr_block = "192.168.0.0/16"
ec2_name_tags = [ "Master-tf", "Master1-tf", "Master2-tf"]
ec2_name_tags_slave = [ "Slave-tf", "Slave1-tf", "Slave2-tf"]
subnet_name_tags = [ "main-sn-tf", "N-sn1-tf", "N-sn2-tf"]
subnet_azs = ["us-west-2a","us-west-2a", "us-west-2a"]
ami_id = "ami-03f65b8614a860c29"
instance_type = "t2.micro"
instance_type_slave = "t2.micro"
instance_count = 1
instance_count_slave = 1
web-trigger = "1.4"    #Comment/change this version if when remote exec(Ec2NullProvisioner.tf/provisioner)shell is only changed.
db-trigger = "1.4"     #Change/update version if only provisioner to be updated
#subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#public_ip = 0.0.0.0    #Run provisioner on particular instances ip count =10 [0....9]
