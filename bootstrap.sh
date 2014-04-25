#!/usr/bin/env bash

# Upgrade Base Packages
sudo apt-get update

# install de_DE locale
sudo locale-gen de_DE.UTF-8

# Install system packages
sudo apt-get install -y build-essential curl libmcrypt4 mc nano htop git

# Download Bash Aliases
# wget -O ~/.bash_aliases

# Download PHP install script
# wget

# Download Apache install script
# wget

# Download MySQL install script
# wget