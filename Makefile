SHELL=/bin/bash

.PHONY:all
all: build

.PHONY:init
init:
	git submodule update --init --recursive
	@yarn

.PHONY:dev
dev: update
	yarn run start

.PHONY:update
update: init
	git pull
	git submodule update --rebase --remote

.PHONY:build
build: update
	@echo building...
	@yarn run build
	@echo built

.PHONY:serve
serve: build
	-pkill node
	nohup yarn run preview > nohup.out &
