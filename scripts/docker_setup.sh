#!/bin/bash

# Install Docker
sudo apt-get update
sudo apt install docker.io

# Start Docker now and on system reboots
sudo systemctl enable --now docker

# Give current user administrative permissions to Docker
sudo usermod -aG docker $USER

# Check docker is installed
docker --version

echo -e "\e[33mDocker successfully installed\e[0m"