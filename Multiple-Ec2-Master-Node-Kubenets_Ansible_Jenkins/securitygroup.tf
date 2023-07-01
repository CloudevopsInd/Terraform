resource "aws_security_group" "tf_sg" {
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
      cidr_blocks      = [ local.anywhere ]
      ipv6_cidr_blocks = ["::/0"]
    } 
    vpc_id = aws_vpc.tf_vpc.id
    depends_on = [
      aws_vpc.tf_vpc
    ]
    tags = {
      "Name" = "Tf-OpenallSg"
    }
}