compose = docker-compose

.PHONY: run build

run: build
	test -n "$(hosts)" # hosts
	${compose} run --rm ansible

build:
	${compose} build
