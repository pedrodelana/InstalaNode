#!/bin/bash
echo "** Docker **"
echo "Updating and installing additional packages."
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "Installing docker"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
printf 'deb [arch=amd64] https://download.docker.com/linux/debian stretch stable\n' \
| sudo tee /etc/apt/sources.list.d/docker-ce.list

echo "** Docker-Compose **"
echo "Updating and installing additional packages."

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "Installing docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo "docker compose version:"
docker-compose --version
sudo chmod 666 /var/run/docker.sock

echo "** NODE **"
echo "Updating and installing additional packages."
sudo apt-get update 
sudo apt-get install -y build-essential libssl-dev curl

echo "Download NODE"
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.0/install.sh -o installnvm.sh  

echo "Installing NODE"
bash installnvm.sh
nvm install v12.16.1
nvm use v12.16.1
