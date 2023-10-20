all: build

update:
	git pull
	git submodule update --rebase --remote

build: update
	yarn
	yarn run build
	node ./dist/server/entry.mjs
