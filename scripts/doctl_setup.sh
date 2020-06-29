#!/bin/bash

### OPTIONS|FLAGS ###
CONTEXT=""
DISTRO="linux-amd64"
V="1.45.1"

while [ -n "$1" ]; do
    case "$1" in
      -c|--context) CONTEXT="$2";;
    	--darwin) DISTRO="darwin-amd64";;
   		-d|--distro) DISTRO="$2";;
    	-v|--version) V="$2";;
    esac
      shift
done

if [ "$CONTEXT" = "" ]; then
	echo "Enter an auth context"
	read VAR
	CONTEXT="$VAR"
fi



cd ~/
curl -LO https://github.com/digitalocean/doctl/releases/download/v$V/doctl-$V-$DISTRO.tar.gz
tar xf ~/doctl-$V-$DISTRO.tar.gz
rm ~/doctl-$V-$DISTRO.tar.gz
sudo mv ~/doctl /usr/local/bin


# Create API token from DO dashboard
# make auth 		NAME MUST BE ALL LOWER CASE, upper case will still create auth but to lower case
doctl auth init --context $CONTEXT

# switch auth context
doctl auth switch --context $CONTEXT

# verify
doctl account get

# Add completions
doctl completion zsh
sed -i "s/source \$ZSH\/oh-my-zsh.sh/source \$ZSH\/oh-my-zsh.sh\nsource  <(doctl completion zsh)/" ~/.zshrc

echo -e "\e[33mdoctl installed:\e[0m \e[34m$SET_THEME\e[0m"
echo -e "\e[32mReload required, enter command below:\e[0m"
echo -e "   \e[35msource ~/.zshrc\e[0m"
