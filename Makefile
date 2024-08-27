all : down up

volume :
	sudo rm -rf /home/khaimer/data/mariadb
	sudo rm -rf /home/khaimer/data/wordpress
	mkdir -p /home/khaimer/data/mariadb
	mkdir -p /home/khaimer/data/wordpress

up :
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down -v

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps