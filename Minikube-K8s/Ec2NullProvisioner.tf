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
       source      = "C:/Users/HP/OneDrive/Desktop/CODE/Terraform/Multiple-Ec2-Master-Node-Kubenets_Ansible_Jenkins/install_minikube_kubectl.sh"  # Replace with the actual path to your local script
        destination = "/home/ubuntu/install_minikube_kubectl.sh"  # Specify the desired destination on the remote machine
       }       
  provisioner "remote-exec" {
  inline = [
        "pwd && ls",
        "chmod +x install_minikube_kubectl.sh",
    ##install Docker/minikube with script
        "sh /home/ubuntu/install_minikube_kubectl.sh",
        "exit"
      ]
   }
  provisioner "remote-exec" {
  inline = [
        "pwd && ls",
        #"ssh -i \"~/.ssh/docker.pem\" ubuntu@[for i in aws_instance.tf_instance : i.public_ip]",
        "ssh -i \"~/.ssh/id_rsa\" ubuntu@[for i in aws_instance.tf_instance : i.public_ip]",
        "minikube stop --driver=docker",
        "kubectl get nodes"
      ]
   } 
}
