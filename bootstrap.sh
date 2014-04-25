#!/usr/bin/env bash

# Upgrade Base Packages
sudo apt-get update

# install de_DE locale
sudo locale-gen de_DE.UTF-8

# Install system packages
sudo apt-get install -y build-essential curl libmcrypt4 mc nano htop git

# Download Bash Aliases
wget -nv -O /home/vagrant/.bash_aliases https://raw.githubusercontent.com/joergpatz/vagrantbox/master/bash_aliases

# Download Apache install script
source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/apache.sh)

# Download PHP install script
source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/php.sh)

# Download MySQL install script
source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/mysql.sh)