all : down up

volume :
	@sudo rm -rf /home/khaimer/Desktop/data/mariadb
	@sudo rm -rf /home/khaimer/Desktop/data/wordpress
	@mkdir -p /home/khaimer/Desktop/data/mariadb
	@mkdir -p /home/khaimer/Desktop/data/wordpress

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