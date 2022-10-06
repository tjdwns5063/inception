NAME = inception

all: $(NAME)

$(NAME):
	docker-compose up -d
	docker-compose exec mariadb /root/sql.sh
	docker-compose exec wordpress /root/script.sh

rebuild: 
	docker-compose down
	docker-compose up -d --build
	docker image prune

clean:
	docker-compose down

fclean:
	docker-compose down
	docker volume rm srcs_db srcs_wp
	docker rmi srcs_mariadb srcs_wordpress srcs_nginx

re: fclean all
