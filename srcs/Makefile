NAME = container

$(NAME):
	docker-compose up -d
	docker-compose exec mariadb /root/sql.sh
	docker-compose exec wordpress /root/script.sh

clean:
	docker-compose down

fclean:
	docker-compose down
	docker volume rm srcs_db srcs_wp
	docker rmi srcs-mariadb srcs-wordpress srcs-nginx