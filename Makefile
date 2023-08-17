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

clean-volumes:
	@echo "\e[31mRemoving volumes\e[0m"
	@docker volume prune -f
	@sudo rm -rf data/db_data
	@mkdir data/db_data

re: fclean build

debug:
	@docker-compose -f $(COMPOSE_FILE) logs

.PHONY: build up down clean clean-volumes debug


