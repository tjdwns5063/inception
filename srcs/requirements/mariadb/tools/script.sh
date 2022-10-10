#!bin/bash

service mariadb start
/root/sql.sh
service mariadb stop
mysqld_safe
