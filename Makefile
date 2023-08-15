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

fclean:
	@echo "\e[31mStopping containers && Removing images\e[0m"
	@docker-compose -f $(COMPOSE_FILE) down --rmi local
	@docker network prune -f

clean-volumes:
	@echo "\e[31mRemoving volumes\e[0m"
	@docker volume prune -f

re: fclean build

debug:
	@docker-compose -f $(COMPOSE_FILE) logs

.PHONY: build up down clean clean-volumes debug


