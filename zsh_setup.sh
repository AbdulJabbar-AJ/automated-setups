#!/bin/bash

### OTIONS|FLAGS ###
if [ -n "$1" ]
then
  while [ -n "$1" ]; do
    case $1 in
      -t|-theme)
        if [ "$2" == "" ]; then
          echo "Enter theme name or press enter for default"
          read VAR
          ZSH_THEME="$VAR"
        else
          ZSH_THEME="$2"
        fi

    esac
      shift
  done
else
  ZSH_THEME=""
fi



### SCRIPT LOGIC ###
# Install zsh
sudo apt install zsh -y

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" “” --unattended

# Change default shell to Zsh
chsh $USER -s /bin/zsh

# Change zsh theme
if [[ $ZSH_THEME ==  "" ]]
then
  echo "Oh My Zsh installed with default theme"
else
  sed -i '' "s/robbyrussel2/${ZSH_THEME}/" ~/.zshrc
  echo "Oh My Zsh installed with theme: $ZSH_THEME"
fi
