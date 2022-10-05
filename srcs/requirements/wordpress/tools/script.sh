#!/bin/bash

# setting
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/'localhost'/'${DB_HOST}'/g" /var/www/html/wordpress/wp-config.php
sed -i "s/'database_name_here'/'${DB_NAME}'/g" /var/www/html/wordpress/wp-config.php
sed -i "s/'username_here'/'${DB_USER_NAME}'/g" /var/www/html/wordpress/wp-config.php
sed -i "s/'password_here'/'${DB_USER_PWD}'/g" /var/www/html/wordpress/wp-config.php

# make user
cd /var/www/html/wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar core install --admin_user=seongjki --admin_password=4242 --admin_email=seongjki@gmail.com --url=https://127.0.0.1 --title="seongjki's blog" --allow-root
# php wp-cli.phar user create seongjki seongjki@gmail.com --role=administrator --user_pass=4242 --allow-root && \
php wp-cli.phar user create user user@naver.com --role=subscriber --user_pass=4242 --allow-root
