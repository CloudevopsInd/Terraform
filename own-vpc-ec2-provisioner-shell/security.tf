resource "aws_security_group" "web_sg" {
    description = "Created by terraform for web"
    ingress   {
      cidr_blocks = [ local.anywhere ]
      description = "open http"
      from_port = local.http_port
      protocol = local.tcp
      to_port = local.http_port
      
    } 
    ingress   {
      cidr_blocks = [ local.anywhere ]
      description = "open ssh"
      from_port = local.ssh_port
      protocol = local.tcp
      to_port = local.ssh_port
      
    }
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    } 
    vpc_id = aws_vpc.my_vpc.id
    depends_on = [
      aws_vpc.my_vpc
    ]
    tags = {
      "Name" = "sg-tf-all"
    }
}