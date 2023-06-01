
all: 
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

dataclean: 
	sudo rm -rf /home/teliet/data/mariadb/*
	sudo rm -rf /home/teliet/data/wordpress/*

clean: 
	docker image prune -a
	docker volume prune
	docker network prune

superclean: clean dataclean
	docker system prune