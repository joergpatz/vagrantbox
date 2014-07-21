#!/usr/bin/env bash

# Install Apache
apt-get install -y apache2
a2enmod rewrite
a2enmod headers

# set Apache Settings
sed -i "s/#ServerRoot.*/ServerName ubuntu/" /etc/apache2/apache2.conf
sed -i "s|DocumentRoot.*|DocumentRoot /var/www|" /etc/apache2/sites-available/000-default.conf
test -d /var/www/html && rm -r /var/www/html

# Create a domainname directory for the example
mkdir -p /var/www/phpinfo.dev
echo "<?php phpinfo();" | tee /var/www/phpinfo.dev/index.php

# Configure Apache Hosts
vhost="<VirtualHost *:80>
    ServerName phpinfo.dev
    DocumentRoot /var/www/phpinfo.dev
    <Directory \"/var/www/phpinfo.dev\">
        Order allow,deny
        Allow from all
        Require all granted
        AllowOverride All
    </Directory>
</VirtualHost>"
echo "$vhost" | tee /etc/apache2/sites-available/phpinfo.dev.conf
a2ensite phpinfo.dev

# Restart apache2 service
service apache2 restart
