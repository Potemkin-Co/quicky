#!/bin/bash
#Script to install CapRover as per official documentation
#TODO: add quick configuration - https://github.com/caprover/caprover-cli#server-setup
##One-liner: wget -O - https://raw.githubusercontent.com/Potemkin-Co/quicky/main/caprover_setup.sh | bash

set -e #no fails

sudo apt-get --assume-yes install npm
sudo npm install -g caprover
sudo docker run -p 80:80 -p 443:443 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover
