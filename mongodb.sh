#!/usr/bin/env bash

# Install MongoDB (http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/)
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Install PHP MongoDB driver (http://docs.mongodb.org/ecosystem/drivers/php/)
printf "\n" | sudo pecl install mongo
echo "extension=mongo.so" | sudo tee /etc/php5/mods-available/mongo.ini
sudo php5enmod mongo

sudo service apache2 reload
sudo service mongod status
php -m | grep mongo

# Getting an AdminUI: http://docs.mongodb.org/ecosystem/tools/administration-interfaces/
wget -nv -O /var/www/phpinfo.dev/genghis.php https://raw.githubusercontent.com/bobthecow/genghis/master/genghis.php