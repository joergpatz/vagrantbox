#!/usr/bin/env bash

# Install latest NodeJS Server
wget -nv http://nodejs.org/dist/node-latest.tar.gz
tar -xvzf node-latest.tar.gz && cd node-v*
./configure && make && make install
npm version
