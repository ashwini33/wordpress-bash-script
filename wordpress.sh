#!/bin/bash

## Operating System Update ##
yum update -y
yum upgrade -y

## Install basic tools ##
yum install wget zip unzip  -y

## Install Web Server . Start and enable the service  ##
yum install httpd -y
systemctl restart httpd
systemctl enable httpd

## Install MariaDB Server . Start and enable MariaDB  ##
yum install mariadb-server mariadb -y
systemctl restart mariadb
systemctl enable mariadb

## Create Database ##
mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE wordpress;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

## Install PHP ##
yum install php php-mysqlnd -y

## Download Wordpress ##
wget https://wordpress.org/latest.zip
unzip -d /var/www/html/ latest.zip
mv /var/www/html/wordpress/* /var/www/html/

## Enable SELinux Policy ##
restorecon -Rv /var/www/

## Add firewall rules ## This section will output an error if "firewall-cmd" package is not installed ##
firewall-cmd --permanent --add-service={http,https}	
firewall-cmd --reload

## Restart all services again ##
systemctl restart httpd
systemctl restart mariadb



