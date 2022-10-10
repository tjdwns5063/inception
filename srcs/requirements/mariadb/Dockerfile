FROM debian:bullseye
RUN apt-get update && apt-get install -y mariadb-server \
	mariadb-client \
	expect \
	vim \
	net-tools \
	dumb-init

COPY ./tools/sql.sh /root/sql.sh
COPY ./tools/script.sh /root/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 755 /root/script.sh /root/sql.sh && \
	mkdir -p /run/mysqld /var/lib/mysql && \ 
	chown -R mysql:mysql /var/lib/mysql /run/mysqld

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/root/script.sh" ]
