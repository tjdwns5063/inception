FROM debian:bullseye

COPY ./tools/script.sh /root/script.sh
COPY ./tools/setup.sh /root/setup.sh

RUN mkdir -p /var/www/html/wordpress
WORKDIR /var/www/html/wordpress

RUN apt-get update -y && apt-get install -y php7.4 \
	php7.4-fpm \
	php7.4-mysql \
	wget \
	curl \
	vim \
	unzip \
	dumb-init \
	net-tools && \
	chmod 755 /root/script.sh /root/setup.sh && \
	chown -R www-data:www-data /var/www/html/

RUN sed -i 's/listen\ =\ \/run\/php\/php7.4-fpm.sock/listen\ =\ wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
	service php7.4-fpm start && service php7.4-fpm stop

ENTRYPOINT [ "dumb-init", "--", "/root/script.sh" ]
