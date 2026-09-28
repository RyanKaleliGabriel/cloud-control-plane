#!/bin/bash
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /usr/share/httpd/noindex/index.html
echo "Port 4326" >> /etc/ssh/sshd_config
systemctl restart sshd