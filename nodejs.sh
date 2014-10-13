#!/usr/bin/env bash

apt-get install -y nodejs
apt-get install -y nodejs-legacy
apt-get install -y npm

# Install latest NodeJS Server
#wget -nv http://nodejs.org/dist/node-latest.tar.gz
#tar -xvzf node-latest.tar.gz && cd node-v*
#./configure && make && make install
#npm version

# Install Forever
npm install -g forever

# Install Bower frontend package management
npm install -g bower

# Debugging
#npm install -g node-inspector
apt-get install -y balance
balance 8585 127.0.0.1:5858
