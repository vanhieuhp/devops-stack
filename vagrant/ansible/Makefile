#!/bin/bash

.PHONY: update-inventory show check-deps deploy

ENV         := $(PWD)/.env
include $(ENV)
export

# Check for required dependencies
check-deps:
	@command -v yq >/dev/null 2>&1 || { echo "Error: yq is required but not installed. Please install yq first."; exit 1; }

# Initialize configuration files

# Verify required files exist
verify-files:
	@if [ ! -f .env ] || [ ! -f inventory.yml ]; then \
		echo "Error: Required files missing!"; \
		[ ! -f .env ] && echo "- .env file not found"; \
		[ ! -f inventory.yml ] && echo "- inventory.yml file not found"; \
		echo "Please run 'make init' first to create the required files."; \
		exit 1; \
	fi

# Update inventory.yml with IP addresses from .env
update-inventory: check-deps verify-files
	@./inventory-helper.sh

# Show current inventory configuration
show: verify-files
	@echo "Current .env configuration:"
	@cat .env
	@echo "\nCurrent inventory.yml configuration:"
	@cat inventory.yml

deploy:
	@ansible-playbook -i inventory.yml k8s_setup.yml

# Help target
help:
	@echo "Available targets:"
	@echo "  update-inventory - Update inventory.yml with values from .env"
	@echo "  show            - Display current .env and inventory.yml contents"
	@echo "  help            - Show this help message"
	@echo "  deploy          - Deploy Kubernetes cluster"

# Set default target
.DEFAULT_GOAL := help

