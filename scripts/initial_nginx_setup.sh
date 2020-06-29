# Install Nginx
sudo apt update
sudo apt install nginx -y


# Firewall
# Open port 80 and 443 for nginx
sudo ufw allow 'Nginx Full'
sudo systemctl restart nginx


# Config file tweaks
# Set hash bucket size
sudo sed -i "s/# server_names_hash_bucket_size/server_names_hash_bucket_size/" /etc/nginx/nginx.conf
# Setup TLS encryption
sed -i -E "s,ssl_protocols(.*),ssl_certificate			PATH/TO/fullchain.pem;\n	ssl_certificate_key		PATH/TO/privkey.pem;\n	ssl_protocols			TLSv1.3;," /etc/nginx/nginx.conf
sed -i "s/server_ciphers on/server_ciphers	off/" /etc/nginx/nginx.conf


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



# Restart Nginx
sudo nginx -t
sudo systemctl restart nginx


