#!/bin/bash

### SCRIPT VARIABLES ###
USERNAME=abduljabbar
ZSH_THEME=ys


### SCRIPT LOGIC ###
# Install zsh
apt install zsh -y

# Add user, with same named group, passing blank gecos values
# adduser --disabled-password --gecos "" --shell /usr/bin/zsh ${USERNAME} //
adduser --gecos "" --shell /usr/bin/zsh ${USERNAME}

# Add user to 'sudo' group
usermod -aG sudo ${USERNAME}

# Copy `authorized_keys` file from root with approriate permissions
rsync --archive --chown=${USERNAME}:${USERNAME} ~/.ssh /home/${USERNAME}

# Change Oh My Zsh install directory to new user's home
export ZSH=/home/“${USERNAME}”

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" “” --unattended
# Note: --unattended does not run change default shell script from installer, but default was already set to zsh on user creation

# Change zsh theme
sed -i ’s/robbyrussell/${ZSH_THEME}/g’ /home/${USERNAME}.zshrc


# Add exception for SSH and then enable UFW firewall
ufw allow OpenSSH
ufw --force enable # --force prevents user prompt

echo "Script Ended"
