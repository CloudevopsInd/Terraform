#!/bin/bash
set -xve
# Install Java Development Kit (JDK)
sudo apt update
sudo apt install -y openjdk-11-jdk

# Import the Jenkins repository key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Add the Jenkins repository to your system
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the package lists
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on system boot
sudo systemctl enable jenkins

# Display the initial Jenkins admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

output=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo PublicIp:$output
echo "Jenkins has been installed please check IP:8080 in your browser"
echo "Jenkins installation Script completed successfully."
exit 0
