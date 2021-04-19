#!/bin/bash
echo "                       ## Docker Installation ##"

OS=0
re='^[0-9]+$'

while [ $OS -lt 1 ] || [ $OS -gt 2 ]
do
echo "What's your Operation System? (1) Deepin (2) Ubuntu/POP OS: "
read OS
done

case $OS in
    1)
        echo "** Docker - Deepin **"
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
        sudo chmod 666 /var/run/docker.sock

        sudo "docker compose version:"
        docker-compose --version
        ;;
    2)
        echo "** Docker - Ubuntu **"
        echo "Updating and installing additional packages."
        sudo apt-get update

        sudo apt-get install -y \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg \
            lsb-release

        echo "Installing docker"
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

        echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

        echo "** Docker-Compose **"
        echo "Updating and installing additional packages."
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io

        echo "Installing docker-compose"
        sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        sudo chmod 666 /var/run/docker.sock

        sudo "docker compose version:"
        docker-compose --version
        ;;
esac
