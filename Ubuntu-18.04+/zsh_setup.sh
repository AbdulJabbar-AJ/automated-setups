#!/bin/bash

### SCRIPT VARIABLES ###
ZSH_THEME=ys

### SCRIPT LOGIC ###
# Install zsh
sudo apt install zsh -y

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" “” --unattended
# Note: --unattended does not run change default shell script from installer, but default was already set to zsh on user creation

# Change zsh theme
sed -i "s:robbyrussel:${ZSH_THEME}:" .zshrc

echo "Script Ended"
