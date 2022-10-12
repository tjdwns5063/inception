NAME = inception
COMPOSE = docker-compose -f./srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	$(COMPOSE) up -d

shell_mariadb:
	$(COMPOSE) exec mariadb /bin/bash

shell_wordpress:
	$(COMPOSE) exec wordpress /bin/bash

shell_nginx:
	$(COMPOSE) exec nginx /bin/bash

clean:
	$(COMPOSE) down

fclean:
	$(COMPOSE) down
	docker rmi mariadb:inception wordpress:inception nginx:inception
	docker volume rm srcs_db srcs_wp
	rm -rf /home/seongjki/data/wp/*
	rm -rf /home/seongjki/data/db/*

re: fclean all
