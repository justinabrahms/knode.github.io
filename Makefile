build:
	mkdir output 2>/dev/null || true
	cp -r stylesheets images javascripts style output
	node main.js

install:
	git submodule update --init
	npm install .

predeploy:
	git checkout build


deploy: predeploy build
	git checkout master
	git mv output/* ./
