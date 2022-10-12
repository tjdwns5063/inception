#!bin/bash

service mysql start
echo "CREATE USER '$DB_ROOT_NAME'@'%' IDENTIFIED BY '$DB_ROOT_PWD';" >> setting.sql
echo "GRANT ALL ON *.* TO '$DB_ROOT_NAME'@'%' IDENTIFIED BY '$DB_ROOT_PWD' WITH GRANT OPTION;" >> setting.sql
chmod 777 setting.sql
mariadb < setting.sql
service mysql stop
mysqld_safe
