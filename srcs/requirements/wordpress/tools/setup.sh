#!/bin/bash

# setup
wget http://wordpress.org/latest.zip -P /var/www/html/wordpress
unzip /var/www/html/wordpress/latest.zip
mv /var/www/html/wordpress/wordpress/* /var/www/html/wordpress
rmdir /var/www/html/wordpress/wordpress
