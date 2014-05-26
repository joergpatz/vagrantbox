#!/usr/bin/env bash

# Install PHP
sudo apt-get install -y php5 php5-dev php5-cli php5-sqlite php5-mysql php5-gd php5-intl php5-curl php5-mcrypt \
php5-xdebug php-pear

# Configure php.ini
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sudo sed -i "s/max_execution_time = .*/max_execution_time = 60/" /etc/php5/apache2/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 8M/" /etc/php5/apache2/php.ini
sudo sed -i "s/allow_url_fopen = .*/allow_url_fopen = Off/" /etc/php5/apache2/php.ini
sudo sed -i "s/short_open_tag = .*/short_open_tag = On/" /etc/php5/apache2/php.ini
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/cli/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/cli/php.ini
sudo sed -i "s/short_open_tag = .*/short_open_tag = On/" /etc/php5/cli/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php5/cli/php.ini

# Configure Mcrypt (Ubuntu 14.04)
sudo php5enmod mcrypt

# Configure XDebug
xdebug="xdebug.default_enable=1
xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_connect_back=1
xdebug.remote_port=9000
xdebug.remote_autostart=0
xdebug.max_nesting_level=200"
echo "$xdebug" | sudo tee -a /etc/php5/mods-available/xdebug.ini
sudo php5enmod xdebug

# Install PHPUnit
wget -nv https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer