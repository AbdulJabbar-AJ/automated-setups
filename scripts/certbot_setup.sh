#!/bin/bash

### OPTIONS|FLAGS ###
URL=""

while [ -n "$1" ]; do
    case "$1" in
      -u|--url)
        URL="$2"
    esac
      shift
done

if [ "$URL" = "" ]; then
	echo "Enter a URL"
	read VAR
	SET_THEME="$VAR"
fi


# Install all relevant packages
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx
sudo apt-get install python3-certbot-dns-digitalocean


# Install certificates
sudo certbot certonly \
	--server https://acme-v02.api.letsencrypt.org/directory \
	--dns-digitalocean \
	--dns-digitalocean-credentials ~/.secrets/certbot/digitalocean.ini \
	--dns-digitalocean-propagation-seconds 60 \
	-d \*.URL \
	-d $URL



# Test renew
sudo certbot renew --dry-run