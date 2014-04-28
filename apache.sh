#!/usr/bin/env bash

# Install and set Apache ServerName
sudo apt-get install -y apache2
sudo sed -i "s/#ServerRoot.*/ServerName ubuntu/" /etc/apache2/apache2.conf

# Configure Apache Hosts
sudo a2enmod rewrite
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

# Reload apache2 service
sudo service apache2 reload