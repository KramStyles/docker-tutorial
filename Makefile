# Define the cli target
cli:
	@docker-compose run --rm app sh -c "$$@"

# Define some example targets that use the cli target
test:
	@$(MAKE) cli python manage.py test

lint:
	@$(MAKE) cli flake8

up:
	docker-compose up

# Define a default target
.DEFAULT_GOAL := help

# Define a help target
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  test    - Run the Django test suite"
	@echo "  lint    - Lint the code with flake8"
	@echo "  cli     - Run a command in the Docker container"
	@echo "          - Usage: make cli [command]"
	@echo "          - Example: make cli python manage.py shell"
