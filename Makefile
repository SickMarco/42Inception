build:
	@docker-compose build --no-cache

up:
	@echo "\e[32mStarting inception\e[0m"
	@docker-compose up -d

down:
	@echo "\e[31mShutdown\e[0m"
	@docker-compose down

fclean:
	@echo "\e[31mStopping containers && Removing images\e[0m"
	@docker-compose down --rmi local
	@echo "\e[31mRemoving networks\e[0m"
	@docker network prune -f

clean-volumes:
	@echo "\e[31mRemoving volumes\e[0m"
	@docker volume prune -f

re:	fclean build

debug: 
	@docker-compose logs

.PHONY: build up down clean clean-volumes debug


