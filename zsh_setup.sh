#!/bin/bash

### OPTIONS|FLAGS ###
SET_THEME=""

while [ -n "$1" ]; do
    case "$1" in
      -t|-theme)
        SET_THEME="$2"
        if [ "$SET_THEME" = "" ]; then
          echo "Enter a theme or press enter to use default theme"
          read VAR
          SET_THEME="$VAR"
        fi

    esac
      shift
done


### SCRIPT LOGIC ###
# Install zsh
sudo apt install zsh -y

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" “” --unattended

# Change default shell to Zsh
chsh $USER -s /bin/zsh

# Change zsh theme if required
if [ "$SET_THEME" == "" ]; then
  echo 'Oh My Zsh installed with default theme'
else
  sed -i "s/robbyrussell/$SET_THEME/" ~/.zshrc
  echo "Oh My Zsh installed with theme: $SET_THEME"
fi
