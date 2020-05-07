#!/bin/bash

### SCRIPT VARIABLES ###
USERNAME=$1

### SCRIPT LOGIC ###
# Add user, with same named group, passing blank gecos values
adduser --gecos "" ${USERNAME}

# Add user to 'sudo' group
usermod -aG sudo ${USERNAME}

# Copy `authorized_keys` file from root to new user with approriate permissions
rsync --archive --chown=${USERNAME}:${USERNAME} ~/.ssh /home/${USERNAME}

# Add exception for SSH and then enable UFW firewall
ufw allow OpenSSH
ufw --force enable

echo "Created user: ${USERNAME}. Server initialised."
