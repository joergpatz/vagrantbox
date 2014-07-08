#!/usr/bin/env bash

# Install Apache
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod headers

# set Apache Settings
sudo sed -i "s/#ServerRoot.*/ServerName ubuntu/" /etc/apache2/apache2.conf
sudo sed -i "s|DocumentRoot.*|DocumentRoot /var/www|" /etc/apache2/sites-available/000-default.conf
test -d /var/www/html && sudo rm -r /var/www/html

# Create a domainname directory for the example
sudo mkdir -p /var/www/phpinfo.dev
echo "<?php phpinfo();" | sudo tee /var/www/phpinfo.dev/index.php

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
echo "$vhost" | sudo tee /etc/apache2/sites-available/phpinfo.dev.conf
sudo a2ensite phpinfo.dev

# Restart apache2 service
sudo service apache2 restart
