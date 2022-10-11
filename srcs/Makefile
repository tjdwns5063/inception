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
	docker rmi mariadb:inception wordpress:inception nginx:inception
	docker volume rm srcs_db srcs_wp
	rm -rf /home/seongjki/data/wp/*
	rm -rf /home/seongjki/data/db/*

re: fclean all
