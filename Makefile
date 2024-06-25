SHELL=/bin/bash

.PHONY:all
all: build

.PHONY:init
init:
	git submodule update --init --recursive
	@yarn

.PHONY:dev
dev: update
	yarn run start --host

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
	@yarn run build
	@echo built

.PHONY:serve
serve: build
	-pkill node
	nohup yarn run preview &
