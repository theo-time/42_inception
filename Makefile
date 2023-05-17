wordpress:
	docker build srcs/requirements/wordpress/ -t wordpress:1.0
	docker run -it wordpress

mariadb:
	docker build srcs/requirements/mariadb/ -t mariadb:1.0
	docker run -it mariadb

nginx: 
	docker build srcs/requirements/nginx/ -t nginx:1.0
	docker run -d -p 443:443 nginx:1.0