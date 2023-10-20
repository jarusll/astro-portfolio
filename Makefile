SHELL=/bin/bash
all: build

update:
	git pull
	git submodule update --rebase --remote

build: update
	yarn
	-pkill node
	yarn run build
	nohup node ./dist/server/entry.mjs &
