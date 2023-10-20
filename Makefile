all: build

update:
	git pull
	git submodule update --rebase --remote

build: update
	yarn
	yarn run build
	pkill -f "node ./dist/server/entry.mjs"
	node ./dist/server/entry.mjs
