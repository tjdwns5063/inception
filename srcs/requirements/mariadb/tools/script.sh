#!bin/bash

service mariadb start
#/root/sql.sh
echo "CREATE DATABASE $DB_NAME;" >> setting.sql
echo "CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PWD';" >> setting.sql
echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PWD' WITH GRANT OPTION;" >> setting.sql
echo "FLUSH PRIVILEGES;" >> setting.sql
echo "use mysql;" >> setting.sql
echo "SET PASSWORD FOR '$DB_ROOT_NAME'@'localhost' = PASSWORD('$DB_ROOT_PWD');" >> setting.sql
echo "FLUSH PRIVILEGES;" >> setting.sql

chmod 755 setting.sql
mariadb -uroot -p$DB_ROOT_PWD < setting.sql
service mariadb stop
mysqld_safe
