#!/usr/bin/env bash

# Upgrade Base Packages
apt-get update

# install de_DE locale
locale-gen de_DE.UTF-8

# Install system packages
apt-get install -y build-essential libmcrypt4 python curl mc nano htop git unzip

# Download Bash Aliases
wget -nv -O /home/vagrant/.bash_aliases https://raw.githubusercontent.com/joergpatz/vagrantbox/master/bash_aliases

# Download Apache install script
source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/apache.sh)

# Download PHP install script
source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/php.sh)

# Download MySQL install script
source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/mysql.sh)

# Download NodeJS install script
#source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/nodejs.sh)

# Download MongoDB install script
#source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/mongodb.sh)
#source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/mongophp.sh)
#source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/mongojs.sh)
