

up:
	sudo docker-compose up

build:
	sudo docker-compose up -d --build

down:
	sudo docker-compose down

rm_network:
	sudo docker network prune -f

rm_container:
	sudo docker container prune -f