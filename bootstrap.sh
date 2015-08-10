#!/usr/bin/env bash

# Fix locale
update-locale LC_ALL=en_US.UTF-8
update-locale LANGUAGE=en_US.UTF-8

# Upgrade Base Packages
apt-get update

# Install system packages
apt-get install -y build-essential python curl libmcrypt4 mc nano htop git unzip jq

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

# Download Wordpress install script
#source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/wordpress.sh)

# Download ImageMagick install script
#source <(wget -qO- https://raw.githubusercontent.com/joergpatz/vagrantbox/master/imagemagick.sh)
