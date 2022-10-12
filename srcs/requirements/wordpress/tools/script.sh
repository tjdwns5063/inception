#!/bin/bash

# make db
# 1. 디비에 wp_db가 있는지 확인
echo "use $DB_NAME;" > check_db; mariadb -h$DB_HOST -u$DB_ROOT_NAME -p$DB_ROOT_PWD < check_db;
while [ $? -eq 1 ]
do
	echo "CREATE DATABASE $DB_NAME;" > create_db; mariadb -h$DB_HOST -u$DB_ROOT_NAME -p$DB_ROOT_PWD < create_db;
done

# 2. 디비에 wp_user가 있는지 확인
echo "use mysql;" > check_user;
echo "select user, host from user where user='seongjki' && host='%'" >> check_user;
mariadb -h$DB_HOST -u$DB_ROOT_NAME -p$DB_ROOT_PWD < check_user > result;
cat result | grep "$DB_USER_NAME"
while [ $? -eq 1  ];
do
	echo "CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PWD';" > /root/setting.sql
	echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PWD' WITH GRANT OPTION;" >> /root/setting.sql
	echo "FLUSH PRIVILEGES;" >> /root/setting.sql
	mariadb -h$DB_HOST -u$DB_ROOT_NAME -p$DB_ROOT_PWD < /root/setting.sql > result;	
done

# wp setup
cd /var/www/html/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

ls /var/www/html/wordpress
if [ $? -eq 2 ];
then
	php wp-cli.phar core download --path=/var/www/html/wordpress --allow-root
	php wp-cli.phar config create --path=/var/www/html/wordpress --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PWD --dbhost=$DB_HOST --allow-root
	php wp-cli.phar core install --path=/var/www/html/wordpress --admin_user=seongjki --admin_password=4242 --admin_email=seongjki@gmail.com --url="https://127.0.0.1" --title="seongjki's blog" --allow-root
	php wp-cli.phar user create --path=/var/www/html/wordpress user user@naver.com --role=subscriber --user_pass=4242 --allow-root
fi

service php7.3-fpm status
if [ $? -eq 3 ];
then
	/usr/sbin/php-fpm7.3 --nodaemonize
else
	echo "daemon is already running"
fi
