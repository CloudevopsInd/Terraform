#!bin/bash
set -xve
"sudo update"
"sudo apt-get install apache2 -y"
"systemctl restart apache2"
"systemctl status apache2"

output=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo PublicIp:$output
echo "Slave has been installed please check IP:80 in your browser"
echo "Slave installation Script completed successfully."
exit 0