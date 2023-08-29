# Makefile

COMPOSE_FILE := srcs/docker-compose.yml

build:
	@docker-compose -f $(COMPOSE_FILE) build --no-cache

up:
	@echo "\e[32mStarting inception\e[0m"
	@docker-compose -f $(COMPOSE_FILE) up -d

down:
	@echo "\e[31mShutdown\e[0m"
	@docker-compose -f $(COMPOSE_FILE) down

clean:
	@echo "\e[31mStopping containers && Removing images\e[0m"
	@docker-compose -f $(COMPOSE_FILE) down --rmi all

fclean: clean
	@docker container prune -f
	@docker builder prune -af
	@docker system prune -a

clean-volumes:
	@echo "\e[31mRemoving volumes\e[0m"
	@docker volume rm db_volume
	@docker volume rm wp_volume
	@sudo rm -rf /home/${USER}/data/
	@mkdir -p /home/${USER}/data/db_data /home/${USER}/data/wp_data

re: fclean build

debug:
	@docker-compose -f $(COMPOSE_FILE) logs

.PHONY: build up down clean fclean clean-volumes debug re


