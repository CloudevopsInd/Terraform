
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

   tags = {
    Name = "tf-vpc"
  }
}
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-subnet"
  }
}

#data "aws_security_group" "tf-sg" {
#  id = "sg-xxx3611xxxx6fdxxx"  # Provide the name of your existing security group here
#  vpc_id = "vpc-xxxx1439xxx8b2xxx"    # Provide the ID of the VPC the security group belongs to
#}



data "aws_key_pair" "docker_key" {
  key_name = "docker"  # Provide the name of your existing key pair here
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-03f65b8614a860c29" # us-west-2
  associate_public_ip_address = true
  instance_type = "t2.micro"
  #vpc_id            = aws_vpc.my_vpc.id
  subnet_id = aws_subnet.my_subnet.id
  key_name      = data.aws_key_pair.docker_key.key_name  # Use the key_name attribute of the data source
  vpc_security_group_ids = [ aws_security_group.web_sg.id]
  #vpc_security_group_ids =[ data.aws_security_group.tf-sg.id ] # Use the security group ID attribute of the data source
  
  tags = {
    Name = "tf-ec2"
  }
  depends_on = [
    aws_subnet.my_subnet,
    data.aws_key_pair.docker_key
  ]



}

