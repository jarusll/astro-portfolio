SHELL=/bin/bash

.PHONY:all
all: build

.PHONY:init
init:
	git submodule update --init --recursive
	@pnpm i

.PHONY:dev
dev: update
	pnpm run start --host

.PHONY:update
update: init
	git pull
	git submodule update --rebase --remote

commit-and-push-submodules:
	git commit -am "Update submodules"
	git push

.PHONY:build
build: update
	@echo building...
	@pnpm run build
	@echo built

.PHONY:serve
serve: build
	-pkill node
	nohup pnpm run preview &
