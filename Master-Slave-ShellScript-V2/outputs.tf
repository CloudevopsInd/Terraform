

output "ec2_public_ips" {
  value = [for i in aws_instance.tf_instance : i.public_ip]
}

output "ec2_public_ips_slave" {
  value = [for i in aws_instance.tf_instance_slave : i.public_ip]
}
#output "PublicIp_of_which_instance_provisioned" {
#  value = var.public_ip
#}

#output "PublicIp_of_which_instance_provisioned" {
  #value = aws_instance.tf_instance[count.index].public_ip
#}


 
#output "aws_key_pair" {
#  value = data.aws_key_pair.existing_key_pair.key_name
#}

#output "VpcId" {
#  value = aws_vpc.tf_vpc.id
#}

#output "vpc_security_group_ids" {
#  value = aws_security_group.tf_sg.id
#}
