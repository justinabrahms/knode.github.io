build:
	mkdir output 2>/dev/null || true
	cp -r stylesheets images javascripts style output
	node main.js

install:
	git submodule update --init
	npm install .

predeploy:
	git checkout build


deploy: predeploy install build
	git checkout master
	rm -rf output/style
	mv output/* ./
	rm -rf style/.git
	git add *.html stylesheets javascripts images style
	git commit -m "compiled from builddir" 
