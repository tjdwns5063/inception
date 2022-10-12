FROM debian:buster

COPY ./tools/script.sh /root/script.sh

RUN mkdir -p /var/www/html/ && \
	apt-get update -y && \
	apt-get install -y wget \ 
	php \
	php-fpm \
	php-mysql \
	mariadb-client \
	curl \
	vim \
	dumb-init \
	net-tools && \
	chmod 755 /root/script.sh && \
	chown -R www-data:www-data /var/www/html/ && \
	sed -i 's/listen\ =\ \/run\/php\/php7.3-fpm.sock/listen\ =\ wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
	service php7.3-fpm start && service php7.3-fpm stop

ENTRYPOINT [ "usr/bin/dumb-init", "--", "/root/script.sh" ]
