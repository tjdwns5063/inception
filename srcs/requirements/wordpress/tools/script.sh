#!/bin/bash

until mariadb -h$DB_HOST -u$DB_ROOT_NAME -p$DB_ROOT_PWD -e 'quit';
do
	echo "mariadb is unavailable"
	sleep 1
done

stat /root/setting.sql
if [ $? -ne 0 ];
then
	echo "CREATE DATABASE $DB_NAME;" > /root/setting.sql
	echo "CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PWD';" >> /root/setting.sql
	echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PWD' WITH GRANT OPTION;" >> /root/setting.sql
	echo "FLUSH PRIVILEGES;" >> /root/setting.sql
	mariadb -h$DB_HOST -u$DB_ROOT_NAME -p$DB_ROOT_PWD < /root/setting.sql
fi

cd /var/www/html/
ls /var/www/html/wordpress
if [ $? -ne 0 ];
then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	php wp-cli.phar core download --path=/var/www/html/wordpress --allow-root
	php wp-cli.phar config create --path=/var/www/html/wordpress --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PWD --dbhost=$DB_HOST --allow-root
	php wp-cli.phar core install --path=/var/www/html/wordpress --admin_user=seongjki --admin_password=4242 --admin_email=seongjki@gmail.com --url="https://127.0.0.1" --title="seongjki's blog" --allow-root
	php wp-cli.phar user create --path=/var/www/html/wordpress user user@naver.com --role=subscriber --user_pass=4242 --allow-root
d
fi

service php7.3-fpm status
while [ $? -ne 0 ];
do
	/usr/sbin/php-fpm7.3 --nodaemonize
	sleep 1
done

