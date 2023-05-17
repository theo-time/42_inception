
mariadb:
	docker build srcs/requirements/mariadb/ -t mariadb:1.0
	

nginx: 
	docker build srcs/requirements/nginx/ -t nginx:1.0
	docker run -d -p 443:443 nginx:1.0