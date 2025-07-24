up :
	mkdir -p /home/franaivo/data/www
	mkdir -p /home/franaivo/data/mysql
	docker compose -f srcs/docker-compose.yml up --build

down : 
	docker compose -f srcs/docker-compose.yml down
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi

fclean :
	sudo rm -rf /home/franaivo/data
