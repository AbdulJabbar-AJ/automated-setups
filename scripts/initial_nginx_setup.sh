#!/bin/bash

CONF_FILE=/etc/nginx/nginx.conf

# Install Nginx
sudo apt update
sudo apt install nginx -y


# Firewall
# Open port 80 and 443 for nginx
sudo ufw allow 'Nginx Full'
sudo systemctl restart nginx


# Config file tweaks
# Set hash bucket size
sudo sed -i "s/# server_names_hash_bucket_size/server_names_hash_bucket_size/" $CONF_FILE
# Setup TLS encryption
# First delete existing ssl certificate paths if any
sed -i -E "/  ssl_certificate(.*)/d" $CONF_FILE
sed -i -E "s,ssl_protocols(.*),ssl_certificate			/etc/letsencrypt/live/ENTER_URL_HERE/fullchain.pem;\n	ssl_certificate_key		/etc/letsencrypt/live/ENTER_URL_HERE/privkey.pem;\n	ssl_protocols			TLSv1.3;," $CONF_FILE
sed -i "s/server_ciphers on/server_ciphers	off/" $CONF_FILE


# Change ownership of 'default' config file
sudo chown $USER:$USER /etc/nginx/sites-available/default

# Set up default server to 403
sudo echo "server {
	server_name	_;
	listen		80 default_server;
	listen		[::]:80 default_server;
	listen		443 default_server;
	listen		[::]:443 default_server;
	return		403;
}" > /etc/nginx/sites-available/default



