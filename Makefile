SHELL=/bin/bash

.PHONY
all: build

.PHONY
update:
	git pull
	git submodule update --rebase --remote

.PHONY
build: update
	yarn
	-pkill node
	yarn run build
	nohup node ./dist/server/entry.mjs &
