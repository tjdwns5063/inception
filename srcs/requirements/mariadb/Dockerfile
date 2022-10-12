FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server \
	mariadb-client \
	expect \
	vim \
	net-tools \
	dumb-init

COPY ./tools/script.sh /root/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld /var/lib/mysql && \ 
	chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
	chmod 777 /root/script.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/root/script.sh" ]
