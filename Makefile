wp_volume=/home/gbussier/data/wordpress
mariadb_volume=/home/gbussier/data/mariadb

up:
	mkdir -p $(wp_volume)
	mkdir -p $(mariadb_volume)
	docker compose -f srcs/docker-compose.yml up -d --build 

down:
	docker compose -f srcs/docker-compose.yml down

rm_volume:
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress

rm_network:
	docker network prune -f

rm_container:
	docker container prune -f

rm_image:
	docker image prune -f

rm_system:
	docker system prune -af

clean: rm_image rm_container rm_network rm_system  rm_volume
	sudo rm -rf $(wp_volume)
	sudo rm -rf $(mariadb_volume)

fclean: down clean

re: fclean up