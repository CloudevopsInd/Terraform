#####################vpc-igw-subnet-rt_attach_igw

resource "aws_internet_gateway_attachment" "example" {
  internet_gateway_id = aws_internet_gateway.example.id
  vpc_id              = aws_vpc.my_vpc.id
}

resource "aws_internet_gateway" "example" {}

#############################
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyRouteTableTF"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example.id
}

#resource "aws_internet_gateway" "example1" {
#  vpc_id = aws_vpc.my_vpc.id

#  tags = {
#    Name = "MyIGW"
#  }
#}
