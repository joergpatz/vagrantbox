#!/usr/bin/env bash
set -e
WORDPRESSPATH=/var/www/wordpress.dev
WORDPRESSDOMAIN=${WORDPRESSPATH##/*/}
MYSQL=`which mysql`
MYSQLDB=wordpress
MYSQLUSER=wordpress
MYSQLPW=wordpress

function salt() {
    date +%s | sha256sum | base64 | head -c 32; return
}

# setup new database for wordpress
Q1="CREATE DATABASE IF NOT EXISTS $MYSQLDB;"
Q2="GRANT ALL ON *.* TO '$MYSQLUSER'@'localhost' IDENTIFIED BY '$MYSQLPW';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

$MYSQL -uroot -proot -e "$SQL"
echo "Database $MYSQLDB and user $MYSQLUSER created with a password $MYSQLPW"

# download wordpress and install files
mkdir -p ${WORDPRESSPATH}
wget https://wordpress.org/latest.zip && unzip latest.zip && mv wordpress* ${WORDPRESSPATH} && rm -f latest.zip

# modify wordpress config file
if [ -f ${WORDPRESSPATH}/wp-config-sample.php ];
then
   cp ${WORDPRESSPATH}/wp-config-sample.php ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('DB_NAME', '.*'/define('DB_NAME', '$MYSQLDB'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('DB_USER', '.*'/define('DB_USER', '$MYSQLUSER'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('DB_PASSWORD', '.*'/define('DB_PASSWORD', '$MYSQLPW'/" ${WORDPRESSPATH}/wp-config.php

   sed -i "s/define('AUTH_KEY',         'put your unique phrase here'/define('AUTH_KEY',         '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('SECURE_AUTH_KEY',  'put your unique phrase here'/define('SECURE_AUTH_KEY',  '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('LOGGED_IN_KEY',    'put your unique phrase here'/define('LOGGED_IN_KEY',    '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('NONCE_KEY',        'put your unique phrase here'/define('NONCE_KEY',        '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('AUTH_SALT',        'put your unique phrase here'/define('AUTH_SALT',        '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('SECURE_AUTH_SALT', 'put your unique phrase here'/define('SECURE_AUTH_SALT', '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('LOGGED_IN_SALT',   'put your unique phrase here'/define('LOGGED_IN_SALT',   '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
   sed -i "s/define('NONCE_SALT',       'put your unique phrase here'/define('NONCE_SALT',       '$(salt)'/" ${WORDPRESSPATH}/wp-config.php
else
   echo "Wordpress files does not exist."
   exit 1;
fi

# Configure Apache Hosts
vhost="<VirtualHost *:80>
    ServerName $WORDPRESSDOMAIN
    DocumentRoot $WORDPRESSPATH
    <Directory \"$WORDPRESSPATH\">
        Order allow,deny
        Allow from all
        Require all granted
        AllowOverride All
    </Directory>
</VirtualHost>"
echo "$vhost" | tee /etc/apache2/sites-available/$WORDPRESSDOMAIN.conf
a2ensite $WORDPRESSDOMAIN

# Restart apache2 service
service apache2 restart