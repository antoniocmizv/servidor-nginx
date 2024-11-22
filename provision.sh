#!/bin/bash

# Update repositories, install Nginx, and install git to fetch the repository
apt update
apt install -y nginx git vsftpd


# Check if Nginx is running
sudo systemctl status nginx

# Create the website directory
sudo mkdir -p /var/www/webPrueba/html

# Clone the example repository into the website directory
git clone https://github.com/cloudacademy/static-website-example /var/www/webPrueba/html

# Set appropriate permissions
sudo chown -R www-data:www-data /var/www/
sudo chmod -R 775 /var/www/

#Configure Nginx to serve the website
# Copy the site configuration file to sites-available
sudo cp /vagrant/webPrueba /etc/nginx/sites-available/

# Create a symbolic link in sites-enabled
sudo ln -s /etc/nginx/sites-available/webPrueba /etc/nginx/sites-enabled/


# Create user antho
sudo adduser antho
echo "antho:antho" | sudo chpasswd

# Create the directory (although it should be created when the user is created)
sudo mkdir -p /home/antho/ftp
sudo chown antho:antho /home/antho/ftp
sudo chmod 775 /home/antho/ftp

# Generate security certificates 
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=ES/ST=Granada/L=Granada/O=Global Security/OU=IES ZAIDIN VERGELES/CN=dj.test"

# Upload the vsftpd configuration file
sudo cp -v /vagrant/vsftpd.conf /etc/vsftpd.conf

# Restart the vsftpd service
sudo systemctl start vsftpd

# Add user antho to the www-data group
sudo usermod -aG www-data antho

# Create the new website directory
sudo mkdir -p /var/www/dj/html/

# Copy the configuration file from /vagrant to /etc/nginx/sites-available
sudo cp /vagrant/dj /etc/nginx/sites-available/

# Create a symbolic link in sites-enabled
sudo ln -s /etc/nginx/sites-available/dj /etc/nginx/sites-enabled/

# Check Nginx configuration before restarting
sudo nginx -t

# Restart Nginx to apply changes
sudo systemctl restart nginx

# Check if Nginx is running
sudo systemctl status nginx

# Restart the vsftpd service
sudo systemctl restart vsftpd


#Acceso mediante SSL
sudo cp /vagrant/example.com /etc/nginx/sites-available/

#Copy the website files to the new directory
sudo cp -r /vagrant/simplewebsite /var/www/example.com/html

# Create a symbolic link in sites-enabled
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/

# configure the firewall
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw --force enable

# Restart Nginx to apply changes
sudo systemctl restart nginx

# Create the SSL certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=ES/ST=Granada/L=Granada/O=Global Security/OU=IES ZAIDIN VERGELES/CN=example.com"




