#!/bin/bash


### OPTIONS|FLAGS ###
DISTRO="amd64"

while [ -n "$1" ]; do
    case "$1" in
   		-d|--distro) DISTRO="$2";;
    esac
      shift
done



cd ~/
curl -LJO https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_$DISTRO.deb
sudo dpkg -i gitlab-runner_$DISTRO.deb
rm gitlab-runner_$DISTRO.deb

echo -e "\e[33mGitlab-runner installed\e[0m"



# COMPLETIONS??