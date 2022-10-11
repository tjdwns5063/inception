#!/bin/bash

# setup
cd /var/www/html/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

php wp-cli.phar core download --path=/var/www/html/ --allow-root

php wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PWD --dbhost=$DB_HOST --allow-root

php wp-cli.phar core install --admin_user=seongjki --admin_password=4242 --admin_email=seongjki@gmail.com --url="https://127.0.0.1" --title="seongjki's blog" --allow-root

# setting
#mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
#sed -i "s/'localhost'/'${DB_HOST}'/g" /var/www/html/wordpress/wp-config.php
#sed -i "s/'database_name_here'/'${DB_NAME}'/g" /var/www/html/wordpress/wp-config.php
#sed -i "s/'username_here'/'${DB_USER_NAME}'/g" /var/www/html/wordpress/wp-config.php
#sed -i "s/'password_here'/'${DB_USER_PWD}'/g" /var/www/html/wordpress/wp-config.php

# make user

php wp-cli.phar user create user user@naver.com --role=subscriber --user_pass=4242 --allow-root
/usr/sbin/php-fpm7.3 --nodaemonize
