wordpress-build:
	docker build srcs/requirements/wordpress/ -t wordpress

mariadb-build:
	docker build srcs/requirements/mariadb/ -t mariadb

nginx-build: 
	docker build srcs/requirements/nginx/ -t nginx

mariadb-run:
	docker run -t mariadb

nginx-run:
	docker run -d -p 443:443 nginx

wordpress-run:
	docker run -t wordpress

fclean: 
	docker image prune -a