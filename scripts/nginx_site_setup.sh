#!/bin/bash

echo "Welcome to the the 'New Project' script"

### OPTIONS|FLAGS ###
while [ -n "$1" ]; do
  case "$1" in
    -m|--main-url) MAIN=true;;
    -ns|--non-static) NS=true;;
    -q|--quiet) QUIET=true;;
    -sdo|--skip-do) IGNORE_DO=true;;
  	-ip|--ip-address) DO_PROJ_IP="$2";;
    -u|--url) URL="$2" && shift;;
    -p|--port) PORT="$2" && shift;;
    *) echo "Option $1 not recognized" && exit 1;;
  esac
    shift
done



DO_PROJ_ID=$(doctl projects get default --format ID | xargs | sed -E 's/ID //' )
DO_PROJ_NAME=$(doctl projects get default --format Name | xargs | sed -E 's/Name //')

### SOME CHECKS ##
# Confirm Digital Ocean Default Project
if [ -z "$IGNORE_DO" ]; then
  if [ -z "$QUIET" ]; then
    echo "You default Digital Ocean Project is: '$DO_PROJ_NAME' (ID: $DO_PROJ_ID)"
    echo -n  "Enter 'y' to continue: "
    read VAR && ANSWER="$VAR"
    if [ ! "$ANSWER" = "y" ];then
      exit 1
    fi
  fi
fi


# Make sure URL is set, otherwise prompt
if [ -z "$URL" ]; then
  echo -n "Enter project URL: "
  read VAR && URL="$VAR"
fi


# If --not-static, make sure port is set, otherwise prompt
if [[ "$NS" = true && -z "$PORT" ]]; then
  echo -n "Enter Docker container interal port: "
  read VAR && PORT="$VAR"
fi





### VARIABLESS ###
NGINX_DIR=/etc/nginx
CONF_FILE=$NGINX_DIR/sites-available/$URL

if [ -z "$NS" ]; then WORKDIR=/var/www/$URL/html; fi
if [ -n "$MAIN" ]; then SERVER_NAME="$URL www.$URL"; else SERVER_NAME=$URL; fi






### SCRIPT LOGIC ###
## Set up files and directories ##
        echo "Creating blank Nginx config file in /etc/nginx/sites-enabled"
touch $CONF_FILE
        echo "Creating symbolic link in 'sites-enabled"
ln -f -s $CONF_FILE $NGINX_DIR/sites-enabled/


if [ -z "$NS" ]; then
        echo "Creating static assets directory in /var/www/"
  mkdir -p $WORKDIR
  cp /usr/share/nginx/html/index.html $WORKDIR
        echo "adjusting static assets directory permissions"
  chown -R $USER:$USER $WORKDIR
fi


## Add URL to Digital Ocean (Requires doctl) ##
if [ -z "$IGNORE_DO" ]; then
        echo "Check existing Digital Ocean resources"
  EXISTS=$(doctl projects resources list $DO_PROJ_ID | grep -q "do:domain:$URL" && echo 1)
  if [ -n "$EXISTS" ]; then
    echo "Domain already exists in Digital Ocean Project"
  else
    echo "Adding URL to Digital Ocean Default Project"
    sudo doctl compute domain create $URL --ip-address $DO_PROJ_IP
  fi
fi



        echo "Generating Nginx configuration ......."
## Write out the config file ##
# Start the file
echo "server {
	listen		443 ssl http2;
	listen		[::]:443 ssl http2;" > $CONF_FILE


# Inlclude static files
if [ -z "$NS" ]; then
echo \
  "	root		$WORKDIR;
	index		index.html;" >> $CONF_FILE
fi


# Server name directive
echo "	server_name	$SERVER_NAME;"  >> $CONF_FILE


# Include redirect
if [ -n "$MAIN" ]; then
echo "
	if (\$host = $URL) {
		return 301 https://www.\$host\$request_uri;
	}
	" >> $CONF_FILE
fi


# Resolve files or port
if [ -z "$NS" ]; then
  echo "	location / { try_files \$uri \$uri/ =404; }" >> $CONF_FILE
else
  echo "
	location / {
		proxy_pass http://localhost:$PORT;
		proxy_http_version 2.0;
		proxy_set_header Upgrade \$http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host \$host;
		proxy_cache_bypass \$http_upgrade;
	}" >> $CONF_FILE
fi

# Close main block
echo "}
" >> $CONF_FILE


# Listen for HTTP
echo \
"server {
	listen		80;
	listen		[::]:80;
	server_name	$SERVER_NAME;
	return		301 https://\$host\$request_uri;
}" >> $CONF_FILE





### Check Config and restart Nginxe ###
nginx -t
systemctl restart nginx

### Write out exit message ###
echo "Script completed!"
echo "Check config file at \e[33m$CONF_FILE\e[0m"
