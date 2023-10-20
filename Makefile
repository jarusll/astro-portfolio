all: build

update:
	git pull
	git submodule update --rebase --remote

build: update
	yarn
	pkill -f "node ./dist/server/entry.mjs"
	yarn run build
	nohup node ./dist/server/entry.mjs &
