#!/bin/bash
#Script to install Docker on Ubuntu as per https://docs.docker.com/engine/install/ubuntu/

sudo apt-get remove docker docker-engine docker.io containerd runc #this can fail

set -e #and the rest shall not

sudo apt-get update
sudo apt-get --assume-yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88 # verify docker signature
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" # as per Install Docker Engine on Ubuntu | Docker Documentation
sudo apt-get update
sudo apt-get --assume-yes install docker-ce docker-ce-cli containerd.io

echo "Trying hello world from Docker..."
sudo docker run hello-world # check if there is Hello from Docker
