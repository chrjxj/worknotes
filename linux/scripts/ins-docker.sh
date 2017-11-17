#!/bin/bash

echo 'install very basic tools'
# Update the apt package index:
sudo apt-get update && sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo apt-key fingerprint 0EBFCD88 && sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update && sudo apt-get install -y docker-ce
# sudo docker run hello-world

sudo groupadd docker
sudo usermod -a -G docker ${USER}
sudo service docker restart
echo 'TODO: add users to docker group...'

# TODO: docker compose and nvidia docker
