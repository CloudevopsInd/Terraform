
resource "aws_vpc" "tf_vpc" {
  cidr_block = var.cidr_block
  tags = {
      "Name" = "tf-vpc-multiple"
    }
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id
}

resource "aws_subnet" "tf_subnet" {
  count             = var.instance_count
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block = cidrsubnet(var.cidr_block,4,count.index)
  availability_zone = var.subnet_azs[count.index]
  #cidr_block        = var.subnet_cidr_blocks[count.index]
  #availability_zone = "${var.region}a"
  tags = {
      "Name" = var.subnet_name_tags[count.index]
    }
}

resource "aws_route_table" "tf_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }
}

resource "aws_route_table_association" "tf_route_table_association" {
  count          = length(aws_subnet.tf_subnet)
  subnet_id      = aws_subnet.tf_subnet[count.index].id
  route_table_id = aws_route_table.tf_route_table.id
}


resource "aws_instance" "tf_instance" {
  count         = var.instance_count
  #count          = 1
  ami           = var.ami_id
  associate_public_ip_address = true
  instance_type = var.instance_type
  key_name = data.aws_key_pair.existing_key_pair.key_name
  subnet_id     = aws_subnet.tf_subnet[count.index].id
  vpc_security_group_ids = [ aws_security_group.tf_sg.id]

  tags = {
      "Name" = var.ec2_name_tags[count.index]
    }

}