#!/bin/bash

#Enter username with flag -u or --username


### OPTIONS|FLAGS ###
USERNAME=""

while [ -n "$1" ]; do
    case "$1" in
      -u|--username)
        USERNAME="$2"
        if [ "$USERNAME" = "" ]; then
          echo "You must enter a valid username"
          exit 1
        fi
    esac
      shift
done

### VARIABLES ###
if [ "$USERNAME" = "" ]; then
  echo "Enter username"
  read VAR
  USERNAME=$VAR
fi




### SCRIPT LOGIC ###
# Add user, with same named group, passing blank gecos values
adduser --gecos "" ${USERNAME}

# Add user to 'sudo' group
usermod -aG sudo ${USERNAME}

# Copy `authorized_keys` file from root to new user with approriate permissions
rsync --archive --chown=${USERNAME}:${USERNAME} ~/.ssh /home/${USERNAME}

echo "Created user: ${USERNAME}"

# Add exception for SSH and then enable UFW firewall
ufw allow OpenSSH
ufw --force enable

echo "Server initialised"
