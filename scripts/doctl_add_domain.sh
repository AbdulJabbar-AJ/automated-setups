#!/bin/bash

### OPTIONS|FLAGS ###
while [ -n "$1" ]; do
  case "$1" in
    -q|--quiet) QUIET=true;;
  	-ip|--ip-address) DO_PROJ_IP="$2" && shift;;
    -u|--url) URL="$2" && shift;;
    *) echo "Option $1 not recognized" && exit 1;;
  esac
    shift
done



DO_PROJ_ID=$(doctl projects get default --format ID | xargs | sed -E 's/ID //' )
DO_PROJ_NAME=$(doctl projects get default --format Name | xargs | sed -E 's/Name //')

### SOME CHECKS ##
# Confirm Digital Ocean Default Project
if [ -z "$QUIET" ]; then
	echo "You default Digital Ocean Project is: '$DO_PROJ_NAME' (ID: $DO_PROJ_ID)"
	echo -n  "Enter 'y' to continue: "
	read VAR && ANSWER="$VAR"
	if [ ! "$ANSWER" = "y" ];then
		exit 1
	fi
fi


# Make sure URL is set, otherwise prompt
if [ -z "$URL" ]; then
  echo -n "Enter project URL: "
  read VAR && URL="$VAR"
fi


## Add URL to Digital Ocean ##
			echo "Check existing Digital Ocean resources"
EXISTS=$(doctl projects resources list $DO_PROJ_ID | grep -q "do:domain:$URL" && echo 1)
if [ -n "$EXISTS" ]; then
	echo "Domain already exists in Digital Ocean Project"
else
	echo "Adding URL to Digital Ocean Default Project"
	doctl compute domain create $URL --ip-address $DO_PROJ_IP
fi



### Write out exit message ###
echo "Script completed!"
