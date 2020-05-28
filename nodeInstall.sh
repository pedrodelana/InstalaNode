#!/bin/bash

sudo apt-get update 
sudo apt-get install -y build-essential libssl-dev curl

curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.0/install.sh -o installnvm.sh  

bash installnvm.sh

nvm install v12.16.1

nvm use v12.16.1
