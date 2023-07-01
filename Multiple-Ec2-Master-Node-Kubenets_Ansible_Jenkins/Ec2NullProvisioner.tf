resource "null_resource" "webprovisoner" {
count = length(aws_instance.tf_instance)
  triggers = {
    running_number = 1.1
  }

      connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")                 #copy your pem key and grant read permissions
        host = aws_instance.tf_instance.*.public_ip[count.index]
        #private_key = file("~/ Downloads/docker.pem")
        #private_key = data.aws_key_pair.docker_key.key_name
        #host = aws_instance.tf_instance.*.public_ip[count.index]            #particular instance
        
      }
      
      provisioner "remote-exec" {
        
      inline = [
        "sudo apt update",
		"sudo apt-get install openjdk-11-jdk -y",
        "sudo apt install nginx -y",
		"sudo apt install git tree curl -y",
		##Install docker on all machines
		"sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh -y",
        "sudo usermod -aG docker ubuntu"
      ]

    }
    depends_on = [ aws_instance.tf_instance ]
  
}