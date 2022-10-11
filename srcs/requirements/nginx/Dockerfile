FROM debian:buster

RUN	apt-get update && apt-get install -y \
	nginx \
	openssl \
	vim \
	expect \
	curl \
	net-tools

COPY ./tools/script.sh /root
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 777 /root/script.sh && \
	expect /root/script.sh

CMD [ "nginx", "-g", "daemon off;" ]
