#!/bin/bash

### SCRIPT VARIABLES ###
USERNAME=abduljabbar

### SCRIPT LOGIC ###
# Add user, with same named group, passing blank gecos values
adduser --gecos "" ${USERNAME}

# Add user to 'sudo' group
usermod -aG sudo ${USERNAME}

# Copy `authorized_keys` file from root with approriate permissions
rsync --archive --chown=${USERNAME}:${USERNAME} ~/.ssh /home/${USERNAME}

# Add exception for SSH and then enable UFW firewall
ufw allow OpenSSH
ufw --force enable # --force prevents user prompt

echo "Script Ended"
