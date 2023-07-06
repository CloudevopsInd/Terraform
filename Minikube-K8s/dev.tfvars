region = "us-west-2"
cidr_block = "192.168.0.0/16"
ec2_name_tags = [ "K8s/minikube/master-tf", "Master1-tf", "Master2-tf"]
subnet_name_tags = [ "main-sn-tf", "N-sn1-tf", "N-sn2-tf"]
subnet_azs = ["us-west-2a","us-west-2a", "us-west-2a"]
ami_id = "ami-03f65b8614a860c29"
instance_type = "t2.medium"
instance_count = 1
web-trigger = "1.13"    #Comment/change this version if when remote exec(Ec2NullProvisioner.tf/provisioner)shell is only changed.
#subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#public_ip = 0.0.0.0    #Run provisioner on particular instances ip count =10 [0....9]
