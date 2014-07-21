#!/usr/bin/env bash

# Install PHP MongoDB driver (http://docs.mongodb.org/ecosystem/drivers/php/)
printf "\n" | pecl install mongo
echo "extension=mongo.so" | tee /etc/php5/mods-available/mongo.ini
php5enmod mongo

service apache2 reload
service mongod status
php -m | grep mongo

# Getting an AdminUI: http://docs.mongodb.org/ecosystem/tools/administration-interfaces/
# Download and unzip rockmongo (http://rockmongo.com/):
wget -nv https://github.com/iwind/rockmongo/archive/master.zip && unzip -q master.zip -d /var/www/phpinfo.dev
