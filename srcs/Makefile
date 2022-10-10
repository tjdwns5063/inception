NAME = inception

all: $(NAME)

$(NAME):
	docker-compose up -d

rebuild: 
	docker-compose down
	docker-compose up -d --build
	docker image prune

clean:
	docker-compose down

fclean:
	docker-compose down
	docker rmi srcs_mariadb srcs_wordpress srcs_nginx
	docker volume rm srcs_db srcs_wp
	rm -rf /home/seongjki/data/wp/*
	rm -rf /home/seongjki/data/db/*

re: fclean all
