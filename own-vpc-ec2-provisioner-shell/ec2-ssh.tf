######### ec2 login null resource, Provisioner remote-exec shell, Copy .pem or public key to id_rsa

resource "null_resource" "webprovisoner" {
  triggers = {
    running_number = 1.1
  }

  provisioner "remote-exec" {

      connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")  #copy your key
        #private_key = data.aws_key_pair.docker_key.key_name
        host = aws_instance.tf-ec2.public_ip 
      }

      inline = [
        "sudo apt update",
        "sudo apt install nginx -y",
        "sudo apt install tree -y"
      ]

    }
    depends_on = [ aws_instance.tf-ec2 ]
  
}