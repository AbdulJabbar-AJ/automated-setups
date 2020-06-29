#!/bin/bash

### OPTIONS|FLAGS ###
SET_THEME=""

while [ -n "$1" ]; do
    case "$1" in
      -t|--theme)
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
EXISTS=$(ls -a ~/ | grep -q ".zshrc" && echo 1)
if [ -n "$EXISTS" ]; then
  echo -e "\e[33mZSH already installed\e[0m"
else
  sudo apt install zsh -y
  echo -e "\e[33mZSH installed\e[0m"
fi

# Install Oh My Zsh
EXISTS=$(ls -a ~/ | grep -q ".oh-my-zsh" && echo 1)
if [ -n "$EXISTS" ]; then
  echo -e "\e[33mOh My Zsh already installed\e[0m"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" “” --unattended
fi


# Change default shell to Zsh
if [ "$SHELL" = "/bin/zsh" ]; then
  echo -e "\e[33mZSH already default shell\e[0m"
else
  sudo chsh $USER -s /bin/zsh
  echo -e "\e[33mshell changed to zsh\e[0m"
fi


# Change zsh theme if required
if [ "$SET_THEME" == "" ]; then
  echo -e '\e[33mZsh and Oh My Zsh installed successfully\e[0m'
else
  sed -i -E "s/ZSH_THEME=\"(.*)\"/ZSH_THEME=\"$SET_THEME\"/" ~/.zshrc
  echo -e "\e[33mOh My Zsh theme changed to:\e[0m \e[34m$SET_THEME\e[0m"
  echo -e "\e[32mReload required\e[0m - \e[33mExit and re-login if first time setup, otherwise command below:\e[0m"
  echo -e "   \e[35msource ~/.zshrc\e[0m"
fi
