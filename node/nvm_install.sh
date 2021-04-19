#!/bin/bash

echo "** NODE **"
echo "Updating and installing additional packages."
sudo apt-get update 
sudo apt-get install -y build-essential libssl-dev curl

echo "Download NVM"
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.0/install.sh -o installnvm.sh  

echo "Installing NVM"
bash installnvm.sh

gnome-terminal -x ./node_install.sh

