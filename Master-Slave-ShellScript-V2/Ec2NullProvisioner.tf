resource "null_resource" "webprovisoner" {
count = length(aws_instance.tf_instance)
  triggers = {
    running_number = var.web-trigger   
  }
  
       connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")                 #copy your pem key and grant read permissions
        host = aws_instance.tf_instance.*.public_ip[count.index]
        #private_key = file("~/ Downloads/docker.pem")
        #private_key = data.aws_key_pair.docker_key.key_name
        #host = aws_instance.tf_instance.*.public_ip[count.index]            #particular instance publicip provision
        }
  provisioner "file" {
       source      = "C:/Users/HP/OneDrive/Desktop/CODE/Terraform/Multiple-Ec2-Master-Node-Kubenets_Ansible_Jenkins/install_jenkins.sh"  # Replace with the actual path to your local script
        destination = "/home/ubuntu/install_jenkins.sh"  # Specify the desired destination on the remote machine
       }  
  provisioner "remote-exec" {
  inline = [
        "pwd && ls",
        "chmod +x install_jenkins.sh",
        #"sudo apt update",             #updated already in the shell
		    "sudo apt-get install openjdk-11-jdk git -y",
        "sudo apt-get install maven -y",
        #"sudo apt install nginx -y",
        #"sudo apt install apache2 -y",
        #"sudo apt install tree curl -y",

    ##install Jenkins with script
        "sh /home/ubuntu/install_jenkins.sh",
        "sleep 120",
	  ##Install docker on all machines
		    #"sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh -y",
        #"sudo usermod -aG docker ubuntu",
        "output=$(dig +short myip.opendns.com @resolver1.opendns.com)",
        "echo Provisioner ended on MasterPublicIp:$output"
      ]
   }
}         

####### Slave configuration 
resource "null_resource" "dbprovisoner" {
count = length(aws_instance.tf_instance_slave)
  triggers = {
    running_number = var.db-trigger
  }     
    
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")                 #copy your pem key and grant read permissions
        host = aws_instance.tf_instance_slave.*.public_ip[count.index]
       }
    provisioner "file" {
        source      = "C:/Users/HP/OneDrive/Desktop/CODE/Terraform/Multiple-Ec2-Master-Node-Kubenets_Ansible_Jenkins/slave.sh"  # Replace with the actual path to your local script
        destination = "/home/ubuntu/slave.sh"  # Specify the desired destination on the remote machine
       }  

    provisioner "remote-exec" {   
    inline = [
        ##install slave with script slave.sh
        "pwd && ls",
        "chmod +x slave.sh",
        "sudo apt-get install openjdk-11-jdk git -y",
        "sudo apt-get install maven -y",
        "sh /home/ubuntu/slave.sh",
        "sleep 120",
        #"sudo apt update",             #updated already in the shell
        "output=$(dig +short myip.opendns.com @resolver1.opendns.com)",
        "echo Provisioner ended on SlavePublicIp:$output"
		    ]
    }
    
    #depends_on = [ aws_instance.tf_instance ]
  
}