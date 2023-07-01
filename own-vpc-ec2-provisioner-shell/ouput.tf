output "ec2_public_ip" {
  description = "The public ip for ssh access"
  value       = aws_instance.tf-ec2.public_ip
}

output "aws_key_pair" {
  value = data.aws_key_pair.docker_key.key_name
}

output "VpcId" {
  value = aws_vpc.my_vpc.id
}

output "vpc_security_group_ids" {
  value = aws_instance.tf-ec2.vpc_security_group_ids
}

output "Security_groups_default" {
  value = aws_instance.tf-ec2.security_groups
  }

