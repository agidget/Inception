all:
	docker-compose -f srcs/docker-compose.yml up -d
ps:
	docker-compose -f srcs/docker-compose.yml ps
stop:
	docker-compose -f srcs/docker-compose.yml stop
down:
	docker-compose -f srcs/docker-compose.yml down
clean:
	docker system prune -af
	docker system prune --volumes -f
	docker container prune -f
	docker image prune -f
	docker volume rm mariadb wordpress
	sudo rm -rf /home/agidget/data/mariadb/*
	sudo rm -rf /home/agidget/data/wordpress/*