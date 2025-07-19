up :
	docker compose -f srcs/docker-compose.yml up --build

down : 
	docker compose -f srcs/docker-compose.yml down
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
