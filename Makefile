compose = docker-compose

.PHONY: run build

run: build
	${compose} run --rm ansible

build:
	${compose} build
