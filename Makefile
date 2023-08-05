build:
	@docker-compose build --no-cache

up:
	@docker-compose up -d

down:
	@docker-compose down

clean:
	@echo "Stopping containers && Removing images"
	@docker-compose down --rmi local
	@echo "Removing networks"
	@docker network prune -f

clean-volumes:
	@echo "Removing volumes..."
	@docker volume prune -f

.PHONY: build up down clean clean-volumes


